package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.Prev;
import kr.or.coupon.model.vo.Coupon;



@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional

	public ArrayList<Member2> allMemberList(String searchType, String searchText, String searchDetail, String period, String start2, String end2, String moreless, String joinStart, String joinEnd,String detail,String memberLevel,String searchText2,int level,int start,int end) {
		
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("searchType", searchType);
			map.put("searchText", searchText);
			map.put("memberLevel", memberLevel);
			map.put("searchDetail",searchDetail);
			map.put("period",period);
			map.put("start", start2);
			map.put("end", end2);
			map.put("moreless", moreless);
			map.put("joinStart", joinStart);
			map.put("joinEnd", joinEnd);
			map.put("searchText2", searchText2);
			map.put("detail", detail);
			map.put("level",level);
			map.put("start2", start);
			map.put("end2", end);
			List list = sqlSession.selectList("member.selectDetailMember",map);
			
			return (ArrayList<Member2>) list;
		}
	

	public int selectTotalCount(String searchType, String searchText, String searchDetail, String period, String start2, String end2, String moreless, String joinStart, String joinEnd,String detail,String memberLevel,String searchText2,int level,int start,int end) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		map.put("memberLevel", memberLevel);
		map.put("searchDetail",searchDetail);
		map.put("period",period);
		map.put("start", start2);
		map.put("end", end2);
		map.put("moreless", moreless);
		map.put("joinStart", joinStart);
		map.put("joinEnd", joinEnd);
		map.put("searchText2", searchText2);
		map.put("detail", detail);
		map.put("level",level);
		map.put("start2", start);
		map.put("end2", end);
		int totalCount = sqlSession.selectOne("member.selectTotalCount",map);
		return totalCount;
	}
	public int addBlackMember(String memberNo) {
		StringTokenizer st = new StringTokenizer(memberNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.update("member.addBlackMember",arr);
		return result;
	}


	public int addNormalMember(String memberNo) {
		StringTokenizer st = new StringTokenizer(memberNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.update("member.addNormalMember",arr);
		return result;
	
	}


	public int deleteMember(String memberNo) {
		StringTokenizer st = new StringTokenizer(memberNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.delete("member.deleteMember",arr);
		return result;
	}


	public int addJori(String memberNo) {
		StringTokenizer st = new StringTokenizer(memberNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.update("member.addJori",arr);
		return result;
	}


	public int createCoupon(HashMap<String, Object> map) {
		int result = sqlSession.insert("coupon.createCoupon",map);
		
		return result;
	}


	public int dropCoupon(HashMap<String, Object> map) {
		 
		
		
		int result = sqlSession.insert("coupon.dropCoupon",map);
		
		return result;
	}


	public HashMap<String, Object> selectMemberNo(HashMap<String, Object> map) {
		List list = sqlSession.selectList("coupon.selectMemberNo",map);
		String couponLast = sqlSession.selectOne("coupon.couponLast");
		map.put("list",list);
		map.put("couponLast", couponLast);
		
		return map;
	}


	public int dropPoint(HashMap<String, Object> map) {
		int result = sqlSession.update("coupon.dropPoint",map);
		return result;
	}


	public Member2 selectOneMember(HashMap<String, Object> map) {
		Member2 m = sqlSession.selectOne("coupon.selectOneMember",map);
		
		return m;
	}


	public ArrayList<Coupon> selectAllCoupon(HashMap<String, Object> map) {
		List list = sqlSession.selectList("coupon.selectAllCoupon",map);
		return (ArrayList<Coupon> )list;
	}


	public int selectCouponTotalCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("coupon.selectCouponTotalCount",map);
		return totalCount;
	}


	public int deleteCoupon(String couponNo) {
		StringTokenizer st = new StringTokenizer(couponNo, ",");
		String[] arr = new String[st.countTokens()];
		for(int i = 0; i<arr.length;i++) {
			arr[i]=st.nextToken();
		}
		int result = sqlSession.delete("coupon.deleteCoupon",arr);
		return result;
	}


	public int pointReset(String memberNo) {
		int result = sqlSession.update("member.pointReset",memberNo);
		return result;
	}


	public Prev selectFreeCount(HashMap<String, Object> map) {
		Prev prev = sqlSession.selectOne("stat.selectFreeCount",map);
		
		return prev;
	}


	public Prev selectFjr(HashMap<String, Object> map) {
		Prev count = sqlSession.selectOne("stat.selectFjr",map);
		return count;
	}


	public Prev selectRecipeCount(HashMap<String, Object> map) {
		Prev recipe = sqlSession.selectOne("stat.selectRecipeCount",map);
		return recipe;
	}


	public Prev selectJoinCount(HashMap<String, Object> map) {
		Prev join = sqlSession.selectOne("stat.selectJoinCount",map);
		return join;
	}


	
		
		
}
