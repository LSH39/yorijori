package kr.or.cookingCls.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kr.or.cookingCls.model.service.CookingClsService;
import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingCls.model.vo.CookingClsPageData;
import kr.or.cookingCls.model.vo.CookingClsPicVO;
import kr.or.cookingRsrv.model.vo.CookingRsrv;
import kr.or.member.model.vo.Member;
import kr.or.review.model.vo.Review;

@Controller
public class CookingClsController {

	@Autowired
	private CookingClsService service;
	
	//쿠킹 클래스 전체 조회
	@RequestMapping(value="/cookingClsList.do")
	public String SelectAllClass(int reqPage, Model model) {
		//새로
		CookingClsPageData ccpd = service.selectAllClass(reqPage);
		
		model.addAttribute("list", ccpd.getList());
		model.addAttribute("pageNavi", ccpd.getPageNavi());
		model.addAttribute("start", ccpd.getList());
		return "cookingcls/cookingClsList";
		
//		ArrayList<CookingCls> list = service.selectAllClass();
//		model.addAttribute("list", list);
//		return "cookingcls/cookingClsList";
	}
	
	//쿠킹 클래스 작성 페이지
	@RequestMapping(value="/cookingClsWriteFrm.do")
	public String CookingClsListWriteFrm() {
		return "cookingcls/cookingClsWriteFrm";
	}
	
	//쿠킹 클래스 작성
	@RequestMapping(value="/cookingClsWrite.do")
	public String cookingClsWrite(CookingCls ccls, Model model) {
		int result = service.insertCookingCls(ccls);
		if(result > 0) {
			model.addAttribute("msg", "작성 성공");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "작성 실패");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");			
		}
		return "common/msg";
	}
	
	/*
	@RequestMapping(value="/cookingClsWrite.do")
	public String cookingClsWrite(CookingCls ccls, MultipartFile[] files, HttpServletRequest request, Model model) {
		ArrayList<CookingClsPicVO> classFiles = new ArrayList<CookingClsPicVO>();
		
		if(files[0].isEmpty()) {
		}else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/cookingcls/");
		
			for(MultipartFile file : files) {
				String filename = file.getOriginalFilename();
				String onlyName = filename.substring(0, filename.indexOf("."));
				String extension = filename.substring(0, filename.indexOf("."));
				String filepath = null;
				
				int cnt = 0;
				
				while(true) {
					if(cnt == 0) {
						filepath = onlyName+extension;
					}else {
						filepath = onlyName+"_"+cnt+extension;
					}
					
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					cnt++;
				}
				try {
					FileOutputStream fos = new FileOutputStream(savePath+filepath);
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
				CookingClsPicVO ccpvo = new CookingClsPicVO();
				ccpvo.setClassFilename(filename);
				ccpvo.setClassFilepath(filepath);
				classFiles.add(ccpvo);
			}
		
		}
		
		int result = service.insertCookingCls(ccls, classFiles);
		
		if(result == 1 || result != classFiles.size()) {
			model.addAttribute("msg", "작성 성공");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "작성 실패");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");			
		}
		return "common/msg";
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="/uploadClsImg.do", produces = "application/json; charset=utf8")
	public String uploadClsImg(MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		//String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		//String fileRoot = contextRoot+"resources/upload/cookingcls";
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/cookingcls/"); //realPath까지 해줘야 /webapp/폴더까지 

		
		String filename = file.getOriginalFilename();	//오리지날 파일명
		String onlyFilename = filename.substring(0, filename.indexOf(".")); //처음부터 .<-바로 앞 인덱스 까지 매개변수 두개면 첫번째 매개변수부터 두번째 매개변수 바로 앞 인덱스 까지
		String extension = filename.substring(filename.lastIndexOf("."));	//파일 확장자
		String filepath = null;
		
		int cnt = 0;
		
		while(true) {
			if(cnt==0) {
				filepath = onlyFilename+extension; //이건 그냥 일반파일
			}else {
				filepath = onlyFilename+"_"+cnt+extension; //이건 파일 중복됐을때 작동되는 조건이니까 _1 _2 _3 .... 
			}
			
			//자바 IO의 파일
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) { //결국 중복되는 파일이 없으면 break가 되면서 while 반복문을 빠져나감
				//그리고 중복되는 파일이 있으면 해당 조건문은 만족되지 않고 바로 아래 증감문이 실행됨 따라서 1이 되고 무한반복 그리고 
				//조건문에 걸려서 break가 되버림 끝
				break;
			}
			cnt++;
		}
		
		
		try {
			FileOutputStream fos = new FileOutputStream(savePath+filepath);
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
			jsonObject.addProperty("url", "/resources/upload/cookingcls/"+filepath); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
		
	}
	
	//쿠킹 클래스 조회
	@RequestMapping(value="/cookingClsView.do")
	public String CookingClsListView(int classNo, HttpSession session , Model model) {
		Member member = (Member)session.getAttribute("m");
		int sessionMemberNo = 0;
		String sessionMemberNickname = "";
		/*
		try {
			sessionMemberNo = member.getMemberNo();
		} catch (NullPointerException e) {
			// TODO: handle exception
			sessionMemberNo = -1;
		}
		*/
		//int dmRoomNo = service.selectOneDmRoomNo(classNo, memberNickname);
		
		CookingCls ccls = service.selectOneClass(classNo); //해당 클래스 번호에 대한 정보 불러오기
		ArrayList<Review> list = service.selectReviewList(classNo); //해당 클래스에 대한 리뷰 리스트 불러오기
		double reviewAvg = service.avgReviewRate(classNo); // 리뷰 점수 평균
		
		if(member != null) {
			sessionMemberNickname = member.getMemberNickname();
			System.out.println(classNo);
			System.out.println(sessionMemberNo);
			boolean rsrvChk = service.selectOneRsrvChk(classNo, sessionMemberNo);//수강 여부 
			boolean reviewChk = service.selectOneReviewChk(classNo, sessionMemberNickname);//리뷰 작성 여부
			System.out.println(rsrvChk);
			System.out.println(reviewChk);
			model.addAttribute("rsrvChk", rsrvChk);
			model.addAttribute("reviewChk", reviewChk);
		}
		model.addAttribute("ccls", ccls);
		model.addAttribute("list", list);
		model.addAttribute("reviewAvg", reviewAvg);
		return "cookingcls/cookingClsView";
	}
	
	
	//쿠킹 클래스 수정 페이지
	@RequestMapping(value="/cookingClsUpdateFrm.do")
	public String CookingClsListUpdateFrm(int classNo, Model model) {
		CookingCls ccls = service.selectOneClass(classNo);
		model.addAttribute("ccls", ccls);
		return "cookingcls/cookingClsUpdateFrm";
	}
	
	//쿠킹 클래스 수정
	@RequestMapping(value="/cookingClsUpdate.do")
	public String CookingClsListUpdate(CookingCls ccls, Model model) {
		int result = service.updateOneClass(ccls);
		if(result > 0) {
			model.addAttribute("msg", "수정 성공!");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "수정 성공!");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}
		return "common/msg";
	}
	
	//쿠킹 클래스 삭제
	@RequestMapping(value="/cookingClsDelete.do")
	public String cookingClsDelete(int classNo, Model model) {
		int result = service.deleteOneClass(classNo);
		
		if(result>0) {
			model.addAttribute("msg", "삭제 성공!");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "삭제 실패!");
			model.addAttribute("loc", "/cookingClsView.do?classNo="+classNo);			
		}
		return "common/msg";
		
	}
}
