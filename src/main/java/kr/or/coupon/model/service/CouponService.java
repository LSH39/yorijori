package kr.or.coupon.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.dao.CouponDao;

@Service
public class CouponService {
	@Autowired
	private CouponDao dao;
	
}
