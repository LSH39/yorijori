package kr.or.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		Notice n = service.selectOneNotice(noticeNo);
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
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeUpdateFrm";
	}
	
	@RequestMapping(value="insertNotice.do")
	public String insertNotice(Model model, Notice n) {
		int result = service.insertNotice(n);
		if(result>0) {
			model.addAttribute("msg", "등록 완료!");
		} else {
			model.addAttribute("msg", "등록 실패......");
		}
			model.addAttribute("loc", "noticeList?reqPage=1");
			return "common/msg";
	}
}
