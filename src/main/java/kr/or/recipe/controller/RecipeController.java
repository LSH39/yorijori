package kr.or.recipe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.select.Evaluator.IsEmpty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.milkit.model.vo.Product;
import kr.or.recipe.model.service.RecipeService;
import kr.or.recipe.model.vo.Category;
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
		ArrayList<RecipeBoard> list = service.selectRecipeList(rb);
		int totalCount = service.recipeTotalCount(rb);
		Category c = new Category();
		c.setLevelNum(rb.getRecipeLevel());
		c.setMaterialNum(rb.getMaterial());
		c.setSituationNum(rb.getSituation());
		model.addAttribute("c",c );
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		return "recipe/recipeBoard";
	}

	@RequestMapping(value = "/recipeWrite.do")
	public String recipeWrite() {
		return "recipe/recipeFrm";
	}

	@RequestMapping(value = "/recipeFrm.do")
	public String recipeFrm(RecipeBoard rb, RecipeContent rc, MultipartFile[] files, Material m, Model model,
			HttpServletRequest request, MultipartFile uploadImg, FileVo fv) {
		String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/recipe/");
		FileVo upFile = uploadFile(uploadImg, savepath);
		rb.setFilepath(upFile.getFilepath());
		int recipeNo = service.insertRecipe(rb);
		int result= 0;
		if(recipeNo>0) {
			String[] mNameList = request.getParameterValues("mNameList");
			for (int i = 0; i < mNameList.length; i++) {
				m.setMAmount(m.getMAmountList()[i]);
				m.setMaterialName(m.getMNameList()[i]);
				result = service.insertMaterial(m,recipeNo);
		}
			if (files[0].isEmpty()) {

			} else {
				String savepath2 = request.getSession().getServletContext().getRealPath("/resources/upload/recipeContent/");
					String[] rContentList = request.getParameterValues("rContentList");
					for(int i=0; i<rContentList.length;i++) {
						if(files[i].isEmpty()) {
							
						}else {
						upFile = uploadFile(files[i], savepath2);
						rc.setFilename(upFile.getFilename());
						rc.setFilepath(upFile.getFilepath());
						rc.setRecipeContent(rc.getRContentList()[i]);
						result = service.insertContent(rc,recipeNo);
						}
					}
					
				}	
		}
		if (result > 0) {
			model.addAttribute("msg", "등록성공");
			model.addAttribute("loc", "/recipeBoard.do");
		} else {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("loc", "/recipeBoard.do");
		}
		return "common/msg";
	}
	private FileVo uploadFile(MultipartFile file, String savepath) {
		String filename = file.getOriginalFilename();
		String onlyfilename = filename.substring(0, filename.indexOf("."));
		String extent = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while (true) {
			if (count == 0) {
				filepath = onlyfilename + extent;
			} else {
				filepath = onlyfilename + "_" + count + extent;
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
		FileVo fv = new FileVo();
		fv.setFilename(filename);
		fv.setFilepath(filepath);
		return fv;
	}

	@RequestMapping(value = "/recipeView.do")
	public String recipeView(int recipeNo, int memberNo, Model model) {
		RecipeBoard rb = service.selectOneRecipe(recipeNo, memberNo);
		ArrayList<RecipeComment> list = service.selectComment(recipeNo);
		model.addAttribute("rb", rb);
		model.addAttribute("list", list);
		return "recipe/recipeView";
	}

	@ResponseBody
	@RequestMapping(value = "/selectComment.do", produces = "application/json;charset=utf-8")
	public String selectComment(int recipeNo) {
		ArrayList<RecipeComment> list = service.selectComment(recipeNo);
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
	@RequestMapping(value = "/deleteLike.do")
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

	@RequestMapping(value = "/updateRecipe.do")
	public String updateRecipe(int recipeNo, int memberNo, Model model) {
		RecipeBoard rb = service.selectOneRecipe(recipeNo, memberNo);
		model.addAttribute("rb", rb);
		return "/recipe/updateRecipeFrm";
	}

	@RequestMapping(value = "/deleteRecipe.do")
	public String deleteRecipe(int recipeNo, Model model) {
		int result = service.deleteRecipe(recipeNo);
		model.addAttribute("msg", "삭제완료");
		model.addAttribute("loc", "/");
		return "common/msg";
	}

	@RequestMapping(value = "updateRecipeFrm.do")
	public String updateRecipeFrm(RecipeBoard rb, Material m, RecipeContent rc, MultipartFile uploadImg, Model model,HttpServletRequest request,MultipartFile[] files) {
		String filename = uploadImg.getOriginalFilename();
		String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/recipe/");
		String filepath = rb.getFilepath();
		int recipeNo = rb.getRecipeNo();
		if (filename != "") {
			File file = new File(savepath + filepath);
			if (file.isFile()) {
				if (file.delete()) {
					FileVo fv = uploadFile(uploadImg, savepath);
					rb.setFilepath(fv.getFilepath());
				} else {
					System.out.println("파일 삭제 실패");
				}
			}else {
				FileVo fv = uploadFile(uploadImg, savepath);
				rb.setFilepath(fv.getFilepath());
			}
		}
		int result = service.updateRecipe(rb);
		if(result>0) {
		String[] mNoList = request.getParameterValues("mNoList");
		for (int i = 0; i < mNoList.length; i++) {
			m.setMaterialNo(Integer.parseInt(m.getMNoList()[i]));
			m.setMAmount(m.getMAmountList()[i]);
			m.setMaterialName(m.getMNameList()[i]);
			result = service.updateMaterial(m);
		}	
		String[] mNameList2 = request.getParameterValues("mNameList2");
		for (int i = 0; i < mNameList2.length; i++) {
			m.setMAmount(m.getMAmountList2()[i]);
			m.setMaterialName(m.getMNameList2()[i]);
			result = service.insertMaterial(m,recipeNo);
	}
		String[] rContentList = request.getParameterValues("rContentList");
		for (int i = 0; i < rContentList.length; i++) {
			rc.setRFileNo(Integer.parseInt(rc.getRcNoList()[i]));
			rc.setRecipeContent(rc.getRContentList()[i]);
			result = service.updateRecipeContent(rc);			
		}
		if (files[0].isEmpty()) {
			System.out.println("엥");
		} else {
				System.out.println(recipeNo);
				String[] rContentList2 = request.getParameterValues("rContentList2");
				for(int i=0; i<rContentList2.length;i++) {
					if(files[i].isEmpty()) {
						
					}else {
					String savepath2 = request.getSession().getServletContext().getRealPath("/resources/upload/recipeContent/");
					FileVo upFile = uploadFile(files[i], savepath2);
					rc.setFilename(upFile.getFilename());
					rc.setFilepath(upFile.getFilepath());
					rc.setRecipeContent(rc.getRContentList2()[i]);
					result = service.insertContent(rc,recipeNo);
					}
				}
				
			}	
				
		if(result>0) {
			model.addAttribute("msg", "수정완료");
			model.addAttribute("loc", "/recipeBoard.do");
		}else {
			model.addAttribute("msg", "수정실패");
			model.addAttribute("loc", "/recipeBoard.do");
		}
		}
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value = "/moreRecipe.do" ,produces = "application/json;charset=utf-8")
	public String moreRecipe(RecipeBoard rb,int start) {
		ArrayList<RecipeBoard>list = service.moreRecipe(start,rb);
		return new Gson().toJson(list);
		
	}
}
