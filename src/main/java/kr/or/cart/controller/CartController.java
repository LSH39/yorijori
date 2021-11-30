package kr.or.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.cart.model.service.CartService;


@Controller
public class CartController {
	@Autowired
	private CartService service;
}
