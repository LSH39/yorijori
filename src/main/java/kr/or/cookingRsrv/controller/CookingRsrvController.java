package kr.or.cookingRsrv.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.cookingRsrv.model.service.CookingRsrvService;
import kr.or.cookingRsrv.model.vo.CookingRsrv;
import kr.or.member.model.vo.Member;

@Controller
public class CookingRsrvController {

	//1->인원모집중 2->마감 3->클래스시작 4-> 종강 5->폐강
	@Autowired
	private CookingRsrvService service;
	
	//imp_uid 는 예약번호 ex)20211207153060 이런식
	//쿠킹 클래스 예약
	@ResponseBody
	@RequestMapping(value="/insertCookingRsrv.do")
	public String insertCookingRsrv(int memberNo, int classNo, String impUid, int classNop, Model model) {
		//회원번호 클래스번호 아잉포트 번호
		//예약할때 해당 클래스 인원수 확인, 없을때 insert 하고 인원수 +1 update 인원수 꽉찼으면 2번으로


		int result = service.insertCookingRsrv(memberNo, classNo, impUid, classNop);

		if(result > 0) {
			return "1";
		}else {
			return "0";
		}

	}
	
	//쿠킹 클래스 예약 내역
	@RequestMapping(value="/cookingRsrvList.do")
	public String selectAllRsrv(Model model, HttpSession session) {
		//int memberNo = (Integer)session.getAttribute("MemberNo");
		Member member = (Member)session.getAttribute("m");
		int memberNo = member.getMemberNo();
		ArrayList<CookingRsrv> list = service.selectAllRsrv(memberNo);
		model.addAttribute("list", list);
		return "cookingrsrv/cookingRsrvList";
	}
	
	//쿠킹 클래스 예약 취소
	@RequestMapping(value="/deleteCookingRsrv.do")
	public String deleteCookingRsrv(int classNo, Model model) {
		int result = service.deleteCookingRsrv(classNo);
		if(result > 0) {
			model.addAttribute("msg", "취소 성공!");
			model.addAttribute("loc", "/");
		}else {
			model.addAttribute("msg", "취소 실패!");
			model.addAttribute("loc", "/");			
		}
		return "common/msg";
	}
}
