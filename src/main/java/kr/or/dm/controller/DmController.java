package kr.or.dm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.dm.model.service.DmService;
import kr.or.dm.model.vo.Dm;
import kr.or.member.model.vo.Member;

@Controller
public class DmController {

	@Autowired
	private DmService service;
	
	//문의 리스트
	@RequestMapping(value="/dmList.do")
	public String dmList(HttpSession session, Model model) {
		Member member = (Member)session.getAttribute("m");
		String dmSender = member.getMemberNickname();
		int memberLevel = member.getMemberLevel();
		ArrayList<Dm> list = service.selectAllDm(dmSender, memberLevel);

		model.addAttribute("list", list);
		return "dm/dmList";
	}
	
	//클래스 뷰에서 문의 목록 ajax테스트 
	@ResponseBody
	@RequestMapping(value="/dmAjaxList.do", produces = "application/json;charset=utf-8")
	public String dmAjaxList(String dmSender, int memberLevel) {
		ArrayList<Dm> list1 = service.selectAllDm(dmSender, memberLevel);
		return new Gson().toJson(list1);
	}
	
	//문의 조회
	@RequestMapping(value="/dmView.do")
	public String dmView(int classNo, HttpSession session , Model model) {
		Member member = (Member)session.getAttribute("m");
		String dmSender = member.getMemberNickname();
		ArrayList<Dm> list = service.selectOneDm(classNo, dmSender);


		System.out.println("dmSender : "+dmSender);
		String receiver = service.selectOneNickname(classNo, dmSender);
		model.addAttribute("list", list);
		model.addAttribute("classNo", classNo);
		model.addAttribute("receiver", receiver);
		return "dm/dmView";
	}
	
	//클래스 뷰에서 AJAX로 문의하기
	@ResponseBody
	@RequestMapping(value="/selectDmListAjax.do", produces = "application/json;charset=utf-8")
	public String dmView2(int classNo, String dmSender) {
		int dmRoomNo = service.selectOneDmRoomNo(classNo, dmSender);
		ArrayList<Dm> list2 = service.selectOneDmList(dmRoomNo);
		return new Gson().toJson(list2);
	}
	
	//클래스 뷰에서 AJAX로 문의 작성
	@ResponseBody
	@RequestMapping(value="/dmSendAjax.do")
	public int dmSendAjax(int classNo, String dmReceiver, String dmSender, String dmContent) {
		//정보 가져와서  클래스랑 내가 쓴거 있는지 우선 검색
		int dmRoomNo = service.selectOneDmRoomNo(classNo, dmSender);
		
		int result = service.insertDm(classNo, dmReceiver, dmSender, dmContent, dmRoomNo);
		if(result > 0) {
			return 1;
		}else {
			return 0;			
		}
	}
	
	//문의 목록에서 조회하는거
	@RequestMapping(value="/dmView1.do")
	public String dmView1(int dmRoomNo, HttpSession session , Model model) {
		
		Member member = (Member)session.getAttribute("m");
		String dmSender = member.getMemberNickname(); //나

		ArrayList<Dm> list = service.selectOneDm(dmRoomNo); 
		
		/*
		Member member = (Member)session.getAttribute("m");
		String dmSender = member.getMemberNickname();
		ArrayList<Dm> list = service.selectOneDm(classNo, dmSender);


		System.out.println("dmSender : "+dmSender);
		String receiver = service.selectOneNickname(classNo, dmSender);
		 */
		model.addAttribute("list", list);

		return "dm/dmView1";
	}
	
	//문의 작성
	@ResponseBody
	@RequestMapping(value="/dmSend.do")	
	public int insertDm(int classNo, String dmReceiver, String dmSender, String dmContent, HttpSession session) {
		String classNoNickname = service.selectOneNickname(classNo); //답장할 전문가 계정이 클래스 개설자랑 같은지
		Member member = (Member)session.getAttribute("m"); //로그인 세션 가져옴
		String sessionNickname = member.getMemberNickname(); //세션 닉네임
		//int dmRoomNo = service.selectOneDmRoomNo(classNo, dmSender); //문의방 숫자	

		int dmRoomNo = -1;
		if(classNoNickname.equals(sessionNickname)) {
			dmRoomNo = service.selectOneDmRoomNo(classNo, dmReceiver); //문의방 숫자			
		}else {
			dmRoomNo = service.selectOneDmRoomNo(classNo, dmSender); //문의방 숫자
		}

		System.out.println("dmRoomNo "+dmRoomNo);
		System.out.println("classNo "+classNo);
		System.out.println("dmReceiver "+dmReceiver);
		System.out.println("dmSender "+dmSender);
		System.out.println("dmContent "+dmContent);
		System.out.println("classNoNickname "+classNoNickname);
		

		
		int result = service.insertDm(classNo, dmReceiver, dmSender, dmContent, dmRoomNo, sessionNickname);
		if(result > 0) {
			return 1; 
		}else {
			return 0;
		}
	}
}
