package kr.or.about.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.about.model.service.AboutService;

@Controller
public class AboutController {
	@Autowired
	private AboutService service;
}
