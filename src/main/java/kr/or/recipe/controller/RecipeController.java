package kr.or.recipe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.service.RecipeService;
import kr.or.recipe.model.vo.FileVo;
import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeComment;
import kr.or.recipe.model.vo.RecipeContent;
import kr.or.recipe.model.vo.RecipeLike;
import kr.or.recipe.model.vo.RecipeReport;
import sun.reflect.generics.visitor.Reifier;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;
	
	@RequestMapping(value = "/recipeBoard.do")
	public String recipeBoard(RecipeBoard rb, Model model) {
		ArrayList<RecipeBoard>list = service.selectRecipeList(rb);
		model.addAttribute("list", list);
		return "recipe/recipeBoard";
	}
	@RequestMapping(value = "/recipeWrite.do")
	public String recipeWrite() {
		return "recipe/recipeFrm";
	}
	
	@RequestMapping(value="/recipeFrm.do")
	public String recipeFrm(RecipeBoard rb, RecipeContent rc, MultipartFile[] files,Material m, Model model, HttpServletRequest request,MultipartFile uploadImg, FileVo fv) {
			String[] mNameList = request.getParameterValues("mNameList");
			for(int i = 0; i<mNameList.length; i++) {
				m.setMAmount(m.getMAmountList()[i]);
				m.setMaterialName(m.getMNameList()[i]);
			}
			String[] rContentList = request.getParameterValues("rContentList");
			for(int i =0; i<rContentList.length;i++) {
				rc.setRecipeContent(rc.getRContentList()[i]);
			}
			String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/recipe/");
			
			FileVo upFile =uploadFile(uploadImg, savepath);
			rb.setFilepath(upFile.getFilepath());
			if(files[0].isEmpty()) {
				
			}else {
				String savepath2 = request.getSession().getServletContext().getRealPath("/resources/upload/recipeContent/");
				for( MultipartFile file2 : files) {
					upFile = uploadFile(file2 ,savepath2);
					rc.setFilename(upFile.getFilename());
					rc.setFilepath(upFile.getFilepath());	
					
				}
			}
			int result = service.insertRecipe(rb, rc, m);
			if(result > 0) {
				model.addAttribute("msg", "등록성공");
				model.addAttribute("loc", "/recipeBoard.jsp");
			}else {
				model.addAttribute("msg", "등록실패");
				model.addAttribute("loc", "/recipeBoard.jsp");
			}
		return "common/msg";
		
	}
	private FileVo uploadFile(MultipartFile file , String savepath) {
		String filename = file.getOriginalFilename();
		String onlyfilename = filename.substring(0,filename.indexOf("."));
		String extent = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while(true) {
			if(count == 0) {
				filepath = onlyfilename + extent;
			}else {
				filepath = onlyfilename + "_" + count + extent;
			}
			File checkFile = new File(savepath + filepath); 
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savepath+filepath));
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
		FileVo fv = new FileVo();
		fv.setFilename(filename);
		fv.setFilepath(filepath);
		return fv;
	}
	@RequestMapping(value = "/recipeView.do")
	   public String recipeView(int recipeNo,int memberNo, Model model) {
		RecipeBoard rb = service.selectOneRecipe(recipeNo,memberNo);
		ArrayList<RecipeComment>list = service.selectComment(recipeNo);
		model.addAttribute("rb", rb);
		model.addAttribute("list", list);
		return "recipe/recipeView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectComment.do" , produces = "application/json;charset=utf-8")
	public String selectComment(int recipeNo) {
		ArrayList<RecipeComment>list = service.selectComment(recipeNo);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value = "/insertComment.do")
	public int insertComment(RecipeComment rc) {
		int result = service.insertComment(rc);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/updateComment.do")
	public int updateComment(RecipeComment rc) {
		int result = service.updateComment(rc);
		return result;
		
	}
	@ResponseBody
	@RequestMapping(value = "/deleteComment.do")
	public int deleteComment(int rCommentNo) {
		int result = service.deleteComment(rCommentNo);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/insertLike.do")
	public int insertLike(RecipeLike rl) {
		int result = service.insertLike(rl);
		return result;
	}
	@ResponseBody
	@RequestMapping(value ="/deleteLike.do")
	public int deleteLike(RecipeLike rl) {
		int result = service.deleteLike(rl);
		return result;
	}
	@ResponseBody
	@RequestMapping(value = "/insertReport.do")
	public int insertReport(RecipeReport rp) {
		int result = service.insertReport(rp);
		return result;
		
	}
}
