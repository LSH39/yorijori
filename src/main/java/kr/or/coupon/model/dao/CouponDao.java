package kr.or.coupon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDao {
	private SqlSessionTemplate sqlSession;
}
