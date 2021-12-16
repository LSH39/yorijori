package kr.or.freeboard.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.freeboard.model.service.FreeboardService;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.freeboard.model.vo.FreeboardComment;
import kr.or.freeboard.model.vo.FreeboardCommentLike;
import kr.or.freeboard.model.vo.FreeboardFile;
import kr.or.freeboard.model.vo.FreeboardLike;
import kr.or.freeboard.model.vo.FreeboardPageData;
import kr.or.freeboard.model.vo.FreeboardViewData;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService service;
	
	@RequestMapping(value="/freeboardList.do")
	public String freeboardList(Model model, int reqPage, int orderIndex) {
		FreeboardPageData fpd = service.selectFreeList(reqPage, orderIndex);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("start", fpd.getStart());
		model.addAttribute("totalCount", fpd.getTotalCount());
		model.addAttribute("orderIndex", orderIndex);
		return "freeboard/boardList";
	}
	
	@RequestMapping(value="/freeView.do")
	public String freeView(Model model, int freeNo) {
		FreeboardViewData fvd = service.selectOneFree(freeNo);
		model.addAttribute("commentList", fvd.getCommentList());
		model.addAttribute("fileList", fvd.getFileList());
		model.addAttribute("fb", fvd.getFb());
		model.addAttribute("profilePath", fvd.getProfilePath());
		return "freeboard/freeView";
	}
	
	@ResponseBody
	@RequestMapping(value="/likeFreeboard.do")
	public int likeFreeboard(Model model, int freeNo, String memberId) {
		int result = service.selectOneFreeLike(freeNo, memberId);
		return result;
	}
	
	@RequestMapping(value="/insertFreeboardLike.do")
	public String insertFreeboardLike(Model model, int freeNo, String memberId) {
		int result = service.insertFreeboardLike(freeNo, memberId);
		if(result>0) {
			model.addAttribute("msg", "추천 완료");
		} else {
			model.addAttribute("msg", "추천 실패....");
		}
			model.addAttribute("loc", "/freeView.do?freeNo="+freeNo);
			return "common/msg";
	}
	
	@RequestMapping(value="/insertFreeboardComment.do")
	public String insertComment(Model model, FreeboardComment fc) {
		int result = service.insertFreeboardComment(fc);
		if(result>0) {
			model.addAttribute("msg", "등록 완료");
		} else {
			model.addAttribute("msg", "등록 실패..");
		}
			model.addAttribute("loc", "/freeView.do?freeNo="+fc.getFreeNo());
			return "common/msg";
	}
	
	@RequestMapping(value="/deleteFc.do")
	public String deleteComment(Model model, int fcNo, int freeNo) {
		int result = service.deleteFreeboardComment(fcNo);
		if(result>0) {
			model.addAttribute("msg", "삭제 완료");
		} else {
			model.addAttribute("msg", "삭제 실패..");
		}
			model.addAttribute("loc", "/freeView.do?freeNo="+freeNo);
			return "common/msg";
	}
	
	@RequestMapping(value="/updateFc.do")
	public String updateComment(Model model, int fcNo, String fcContent, int freeNo) {
		int result = service.updateFreeboardComment(fcNo, fcContent);
		if (result>0) {
			model.addAttribute("msg", "수정 완료");
		} else {
			model.addAttribute("msg", "수정 실패");
		}
			model.addAttribute("loc", "/freeView.do?freeNo="+freeNo);
			return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value="/fcLikeCheck.do")
	public ArrayList<FreeboardLike> fcLikeCheck(Model model, String memberId, int freeNo){
		ArrayList<FreeboardLike> list = service.selectFcLikeList(memberId, freeNo);
		return list;
	}
	
	@RequestMapping(value="/insertFcLike.do")
	public String insertFcLike(Model model, int fcNo, String memberId, int freeNo) {
		int result = service.insertFcLike(fcNo, memberId);
		if(result>0) {
			model.addAttribute("msg", "추천 완료");
		} else {
			model.addAttribute("msg", "추천 실패....");
		}
			model.addAttribute("loc", "/freeView.do?freeNo="+freeNo);
			return "common/msg";
	}
	
	@RequestMapping(value="/freeWriteFrm.do")
	public String freeWriteFrm() {
		return "freeboard/freeWriteFrm";
	}
	
	@RequestMapping(value="/insertFree.do")
	public String insertFree(Freeboard f, Model model, MultipartFile[] upfile, HttpServletRequest request) {
		//파일목록 저장할 list
		ArrayList<FreeboardFile> list = new ArrayList<FreeboardFile>();
		if(upfile[0].isEmpty()) {
			//첨부파일 없는 경우
		} else {
			//파일업로드 경로 설정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/freeboard/");
			for(MultipartFile file : upfile) {
				//파일명 중복처리
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf("."));
				String extension = filename.substring(filename.indexOf(".")); //확장자명
				//실제로 업로드할 파일명 저장할 변수
				String filepath = null;
				int count = 0;
				while(true) {
					if(count == 0) {
						filepath = onlyFilename + extension;
					} else {
						filepath = onlyFilename + "_" + count + extension; //중복 될 경우
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				//파일명 중복처리 완료. 업로드 시작
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
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
				FreeboardFile ff = new FreeboardFile();
				ff.setFfFilename(filename);
				ff.setFfFilepath(filepath);
				list.add(ff);
			}
		}
		int result = service.insertFreeboard(f, list);
		if(result == -1 || result != list.size()) {
			model.addAttribute("msg", "등록 실패");
		} else {
			model.addAttribute("msg", "등록 완료");
		}
		model.addAttribute("loc", "/freeboardList.do?reqPage=1&orderIndex=0");
		return "common/msg";
		
	}
	
	@RequestMapping(value="/freeSearch.do")
	public String freeSearch(Model model, String searchtype, String searchword) {
		FreeboardPageData searchResult = service.selectFreeList(searchtype, searchword);
		model.addAttribute("list", searchResult.getList());
		model.addAttribute("pageNavi", searchResult.getPageNavi());
		model.addAttribute("start", searchResult.getStart());
		model.addAttribute("totalCount", searchResult.getTotalCount());
		return "freeboard/searchList";
		
	}
	
	@RequestMapping(value="/fileDownFree.do")
	public void fileDown(Model model, HttpServletRequest request, HttpServletResponse response, int ffNo) throws IOException {
		FreeboardFile ff = service.getFreeboardFile(ffNo);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/freeboard/");
		String file = savePath + ff.getFfFilepath();
		
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		String resFilename = "";
		Boolean bool = 
				request.getHeader("user-agent").indexOf("MSIE") != -1 ||
				request.getHeader("user-agent").indexOf("Trident") != -1;
		if(bool) { //브라우저 IE인 경우
			resFilename = URLEncoder.encode(ff.getFfFilename(), "UTF-8");
			resFilename = resFilename.replaceAll("\\\\", "%20");
		} else {
			resFilename = new String(ff.getFfFilename().getBytes("UTF-8"), "ISO-8859-1");
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
	
}
