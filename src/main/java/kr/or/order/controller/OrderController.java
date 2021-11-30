package kr.or.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.order.model.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	private OrderService service;
}
