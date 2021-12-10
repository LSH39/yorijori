package kr.or.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import kr.or.notice.model.service.NoticeService;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(Model model, int reqPage) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		model.addAttribute("start", npd.getStart());
		model.addAttribute("totalCount", npd.getTotalCount());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return "notice/noticeWriteFrm";
	}
	
	@RequestMapping(value="/noticeView.do")
	public String noticeView(Model model, int noticeNo) {
		Notice n = service.viewOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/deleteNotice.do")
	public String noticeDelete(Model model, int noticeNo) {
		int result = service.deleteNotice(noticeNo);
		if(result>0) {
			model.addAttribute("msg", "삭제 성공!");
		} else {
			model.addAttribute("msg", "삭제 실패.....에러 찾아라");
		}
			model.addAttribute("loc", "/noticeList.do?reqPage=1");
			return "common/msg";
	}
	
	@RequestMapping(value="/noticeUpdateFrm.do")
	public String noticeUpdateFrm(Model model, int noticeNo) {
		Notice n = service.getNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeUpdateFrm";
	}
	
	@RequestMapping(value="/insertNotice.do")
	public String insertNotice(Model model, MultipartFile file, HttpServletRequest request, Notice n) {
		if(file == null) {
			//첨부파일 없는 경우
		} else {
			//첨부파일 있는 경우
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf(".")); //파일명
			String extension = filename.substring(filename.indexOf(".")); //확장자
			//업로드할 파일명을 저장할 변수
			String filepath = null;
			int count = 0;
			while(true) {
				if(count == 0) {
					filepath = onlyFilename+extension; //test.txt (중복이 안된 경우!)
				} else {
					filepath = onlyFilename+"_"+count+extension; //test_3.txt (중복이 되면)
				}
				File checkFile = new File(saveDirectory+filepath); //java.io.File
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			//파일명 중복처리 끝나면 파일 업로드하기
			try {
				//중복처리가 끝난 파일명(filepath)로 파일을 업로드
				FileOutputStream fos = new FileOutputStream(new File(saveDirectory+filepath));
				//업로드 속도증가를 위한 보조스트림
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일 업로드
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
				n.setFilename(filename);
				n.setFilepath(filepath);
		}
			int result = service.insertNotice(n);
			if(result>0) {
				model.addAttribute("msg", "등록 완료!");
			} else {
				model.addAttribute("msg", "등록 실패......");
			}
				model.addAttribute("loc", "/noticeList.do?reqPage=1");
				return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadNoticeImage.do")
	public void uploadFile(HttpServletRequest request, MultipartFile file, HttpServletResponse response, Model model) throws ServletException, IOException {
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.indexOf(".")); //파일명
		String extension = filename.substring(filename.indexOf(".")); //확장자
		//업로드할 파일명을 저장할 변수
		String filepath = null;
		int count = 0;
		while(true) {
			if(count == 0) {
				filepath = onlyFilename+extension; //test.txt (중복이 안된 경우!)
			} else {
				filepath = onlyFilename+"_"+count+extension; //test_3.txt (중복이 되면)
			}
			File checkFile = new File(saveDirectory+filepath); //java.io.File
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		PrintWriter out = response.getWriter();
		out.print("/resources/upload/notice/"+filepath);
	}
}