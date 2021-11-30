package kr.or.milkit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.milkit.model.service.MilkitService;

@Controller
public class MilkitController {
	@Autowired
	private MilkitService service;


}
