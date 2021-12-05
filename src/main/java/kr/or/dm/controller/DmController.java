package kr.or.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		for(Dm i: list) {
			System.out.println(i.getDmReceiver());
		}
		model.addAttribute("list", list);
		return "dm/dmList";
	}
	
	//문의 조회
	@RequestMapping(value="/dmView.do")
	public String dmView(int memberNo, Model model) {
		ArrayList<Dm> list = service.selectOneDm(memberNo);
		model.addAttribute("list", list);
		return "dm/dmView";
	}
}
