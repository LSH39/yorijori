package kr.or.coupon.model.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CouponRowMapper implements RowMapper{
	@Override
	public Object mapRow(ResultSet rs,int rowNum) throws SQLException{
		Coupon c = new Coupon();
		c.setCouponNo(rs.getInt("coupon_no"));
		c.setCouponName(rs.getString("coupon_name"));
		c.setCouponStart(rs.getString("coupon_start"));
		c.setCouponEnd(rs.getString("coupon_end"));
		c.setCouponAmount(rs.getInt("coupon_amount"));
		c.setCouponDate(rs.getString("coupon_date"));
		c.setCouponDiscount(rs.getString("coupon_discount"));
		return c;
	}
}
