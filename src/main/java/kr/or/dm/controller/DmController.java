package kr.or.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dm.model.service.DmService;
import kr.or.dm.model.vo.Dm;

@Controller
public class DmController {

	@Autowired
	private DmService service;
	
	//문의 리스트
	@RequestMapping(value="/dmList.do")
	public String dmList(Model model) {
		ArrayList<Dm> list = service.selectAllDm();
		
		//이거 출력테스트
		for(Dm i: list) {
			System.out.println(i.getDmReceiver());
		}
		model.addAttribute("list", list);
		return "dm/dmList";
	}
	
	//문의 조회
	@RequestMapping(value="/dmView.do")
	public String dmView(int classNo, Model model) {

		ArrayList<Dm> list = service.selectOneDm(classNo);
		String receiver = service.selectOneNickname(classNo);
		model.addAttribute("list", list);
		model.addAttribute("classNo", classNo);
		model.addAttribute("receiver", receiver);
		return "dm/dmView";
	}
	
	//문의 작성
	@ResponseBody
	@RequestMapping(value="/dmSend.do")
	public String insertDm(int classNo, String dmReceiver, String dmSender, String dmContent) {
		System.out.println("classNo "+classNo);
		System.out.println("dmReceiver "+dmReceiver);
		System.out.println("dmSender "+dmSender);
		System.out.println("dmContent "+dmContent);
		int result = service.insertDm(classNo, dmReceiver, dmSender, dmContent);
		if(result > 0) {
			return "1"; 
		}else {
			return "0";
		}
	}
}
