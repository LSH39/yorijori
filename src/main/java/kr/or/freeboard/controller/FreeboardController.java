package kr.or.freeboard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.freeboard.model.service.FreeboardService;
import kr.or.freeboard.model.vo.FreeboardComment;
import kr.or.freeboard.model.vo.FreeboardCommentLike;
import kr.or.freeboard.model.vo.FreeboardLike;
import kr.or.freeboard.model.vo.FreeboardPageData;
import kr.or.freeboard.model.vo.FreeboardViewData;

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
}
