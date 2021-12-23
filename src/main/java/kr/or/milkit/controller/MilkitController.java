package kr.or.milkit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.milkit.model.service.MilkitService;
import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.vo.FileVo;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.review.model.vo.Review;

@Controller
public class MilkitController {
	@Autowired
	private MilkitService service;

	@RequestMapping("/milkitList.do")
	public String newMilkitList(int boardNo,Model model) {
		ArrayList<Product> list;
		if(boardNo == 1) {
		list = service.selectMilkitList1();
		}else{
		list = service.selectMilkitList2();
		}
		int totalCount = service.selectTotalCount();
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		return "/product/milkitList";
	}
	
	@RequestMapping(value = "/milkitFrm1.do")
	public String milkitFrm1(int memberNo, Model model) {
		ArrayList<RecipeBoard> list = service.selectRecipeList(memberNo);
		model.addAttribute("list", list);
		return "/product/milkitFrm";
	}

	@RequestMapping(value = "/milkitFrm2.do")
	public String milkitFrm2(int recipeNo, Model model) {
		model.addAttribute("recipeNo", recipeNo);
		return "/product/milkitFrm2";
	}
	@ResponseBody
	@RequestMapping(value = "/image.do" , produces = "application/json;charset=utf-8")
	public String image(MultipartFile file, HttpServletRequest request) {
		String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/product/");
		String filepath = uploadFile(file, savepath);
		return new Gson().toJson("/resources/upload/product/"+filepath);
	}
	@RequestMapping(value = "/insertMilkit.do")
	public String insertMilkit(MultipartFile uploadImg , Product p, Model model,HttpServletRequest request) {
		System.out.println(uploadImg);
		String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/product/");
		String filepath = uploadFile(uploadImg,savepath);
		p.setFilepath(filepath);
		int result = service.insertMilkit(p);
		if(result>0) {
			model.addAttribute("msg", "등록성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("loc", "/");
		}
		
		return "common/msg";
		
	}
	private String uploadFile(MultipartFile file, String savepath) {
		String filename = file.getOriginalFilename();
		String onlyFileName = filename.substring(0, filename.indexOf("."));
		String extent = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyFileName + extent;
			} else {
				filepath = onlyFileName + "_" + count + extent;
			}
			File checkFile = new File(savepath + filepath);
			if (!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savepath + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return filepath;
	}
	@ResponseBody
	@RequestMapping(value = "/moreProduct.do" ,produces = "application/json;charset=utf-8" )
	public String moreProduct(int start,int boardNo) {
		ArrayList<Product>list = service.selectMoreProduct(start,boardNo);
		return new Gson().toJson(list);	
	}
	@RequestMapping(value="/milkitView.do")
	public String milkitView(int productNo,int recipeNo,Model model) {
		Product p = service.selectOneProduct(productNo, recipeNo);
		model.addAttribute("p", p);
		return "/product/milkitView";
	}
	@RequestMapping(value = "/deleteMilkit.do")
	public String deleteMilkit(int productNo,Model model) {
		int result = service.deleteMilkit(productNo);
		if(result>0) {
			model.addAttribute("msg", "삭제성공");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "삭제실패");
			model.addAttribute("loc", "/");
		}
		return "common/msg";	
	}
	@RequestMapping(value = "/updateMilkit.do")
	public String updateMilkit(int productNo,Model model) {
		Product p = service.selectOneProduct2(productNo);
		model.addAttribute("p", p);
		return "/product/updateFrm";	
	}
	@RequestMapping(value = "/updateFrm.do")
	public String updateFrm(Product p,Model model,MultipartFile uploadImg,HttpServletRequest request) {
		String filename = uploadImg.getOriginalFilename();
		String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/product/");
		String filepath = p.getFilepath();
		if (filename != "") {
			File file = new File(savepath + filepath);
			if (file.isFile()) {
				if (file.delete()) {
					String filepath2 = uploadFile(uploadImg, savepath);  
					p.setFilepath(filepath2);
				} else {
					System.out.println("파일 삭제 실패");
				}
			}else {
				String filepath2 = uploadFile(uploadImg, savepath);  
				p.setFilepath(filepath2);
			}
		}
		int result = service.updateMilkit(p);
		if(result>0) {
		model.addAttribute("msg", "수정 성공");
		model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("loc", "/");
		}
		return "common/msg";
	}

}
