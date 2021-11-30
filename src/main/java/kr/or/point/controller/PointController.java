package kr.or.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.point.model.service.PointService;

@Controller
public class PointController {
	@Autowired
	private PointService service;
}
