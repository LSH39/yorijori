package kr.or.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
import kr.or.notice.model.vo.NoticeViewData;

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
		NoticeViewData nvd = service.selectNoticeViewData(noticeNo);
		model.addAttribute("n", nvd.getN());
		model.addAttribute("pNo", nvd.getPNo());
		model.addAttribute("nNo", nvd.getNNo());
		model.addAttribute("pn", nvd.getPn());
		model.addAttribute("nn", nvd.getNn());
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
	public String insertNotice(Model model, MultipartFile upfile, HttpServletRequest request, Notice n) {
		if(upfile.isEmpty()) {
			//첨부파일 없는 경우
		} else {
			//첨부파일 있는 경우
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			String filename = upfile.getOriginalFilename();
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
				byte[] bytes = upfile.getBytes();
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
	public String uploadNoticeImage(MultipartFile file, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.indexOf("."));
		String extension = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count=0;
		while(true) {
			if(count == 0 ) {
				filepath = onlyFilename+extension;
			}else {
				filepath = onlyFilename+"_"+count+extension;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			// 업로드 속도증가를 위한 보조스트림
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			// 파일 업로드
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
		return "/resources/upload/notice/" + filepath;		
	}
	
	
	@RequestMapping(value="/noticeSearch.do")
	public String noticeSearch(Model model, String searchtype, String searchword) {
		NoticePageData searchResult = service.selectNoticeList(searchtype, searchword);
		model.addAttribute("list", searchResult.getList());
		model.addAttribute("pageNavi", searchResult.getPageNavi());
		model.addAttribute("start", searchResult.getStart());
		model.addAttribute("totalCount", searchResult.getTotalCount());
		return "notice/searchList";
		
	}
	
	@RequestMapping(value="/fileDownNotice.do")
	public void fileDown(Model model, HttpServletRequest request, HttpServletResponse response, int noticeNo) throws IOException {
		Notice n = service.getNotice(noticeNo);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		String file = savePath + n.getFilepath();
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String resFilename = "";
		Boolean bool = 
				request.getHeader("user-agent").indexOf("MSIE") != -1 ||
				request.getHeader("user-agent").indexOf("Trident") != -1;
		if(bool) { //브라우저 IE인 경우
			resFilename = URLEncoder.encode(n.getFilename(), "UTF-8");
			resFilename = resFilename.replaceAll("\\\\", "%20");
		} else {
			resFilename = new String(n.getFilename().getBytes("UTF-8"), "ISO-8859-1");
		}
		response.setContentType("application/octet-stream");
		//다운로드할 파일 이름 저장
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		
		//파일 전송
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			} else {
				break;
			}
		}
		bis.close();
		bos.close();
	}
	
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Model model, MultipartFile upfile, HttpServletRequest request, Notice n, String oldFilepath) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		
		//기존 파일 삭제
		if(oldFilepath != null) {
			String fullPath = savePath + n.getFilepath();
			File f = new File(fullPath);
			if(f.isFile()) {
				f.delete();
			}
		}
		
		if(upfile.isEmpty()) {
			//첨부파일 없는 경우
		} else {
			//첨부파일 있는 경우
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			String filename = upfile.getOriginalFilename();
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
				byte[] bytes = upfile.getBytes();
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
			int result = service.updateNotice(n);
			if(result>0) {
				model.addAttribute("msg", "수정 완료!");
			} else {
				model.addAttribute("msg", "수정 실패......");
			}
				model.addAttribute("loc", "/noticeList.do?reqPage=1");
				return "common/msg";
		
	}
	
}