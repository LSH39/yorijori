package kr.or.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.coupon.model.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	private CouponService service;
}
