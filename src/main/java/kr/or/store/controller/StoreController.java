package kr.or.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.store.model.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	
	@RequestMapping(value="/storeList.do")
	public String storeList() {
		return "store/storeList";
	}
}
