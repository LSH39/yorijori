package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.CouponPageData;
import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.admin.model.vo.Prev;
import kr.or.coupon.model.vo.Coupon;


@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	

	public MemberPageData allMemberList(int reqPage, String searchType, String searchText, String searchDetail, String period, String start2, String end2, String moreless, String joinStart, String joinEnd,String detail,String align, String memberLevel,String searchText2,int level,String gotothe) {
		int numPerPage =10;
		if(align!=null) {
			numPerPage = Integer.parseInt(align);
		}
		if(memberLevel==null) {
			memberLevel = "0";
		}
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		ArrayList<Member2> list = dao.allMemberList(searchType,searchText,searchDetail,period,start2,end2,moreless,joinStart,joinEnd,detail,memberLevel,searchText2,level,start,end);
		int totalCount = dao.selectTotalCount(searchType,searchText,searchDetail,period,start2,end2,moreless,joinStart,joinEnd,detail,memberLevel,searchText2,level,start,end);
		
		int totalPage=0;
		if(totalCount % numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/"+gotothe+".do?reqPage=" + (pageNo - 1) + "&align="+numPerPage+"&memberLevel="+memberLevel+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo + "&align="+numPerPage+"&memberLevel="+memberLevel+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>"; 
				pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo +"&align="+numPerPage+"&memberLevel="+memberLevel+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo + "&align="+numPerPage+"&memberLevel="+memberLevel+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(list,pageNavi,totalCount);
		return mpd;
		
		
	}

	public int addBlackMember(String memberNo) {
		int result = dao.addBlackMember(memberNo);
		return result;
	}

	public int addNormalMember(String memberNo) {
		int result = dao.addNormalMember(memberNo);
		return result;
	}

	public int deleteMember(String memberNo) {
		int result = dao.deleteMember(memberNo);
		return result;
	}

	public int addJori(String memberNo) {
		int result = dao.addJori(memberNo);
		return result;
	}

	public int createCoupon(HashMap<String, Object> map) {
		
		
		int result = dao.createCoupon(map);
		int method =  Integer.parseInt((String)map.get("method")) ;
		int type = Integer.parseInt((String)map.get("type"));
		
		System.out.println(method);
		int result2 =0;
		if(result>0 && method==2 &&type==1) {
			map  = dao.selectMemberNo(map);
			List list =(List) map.get("list");
			for(int i=0; i<list.size();i++) {
			String memberNo= (String)list.get(i);
			String couponNo = (String) map.get("couponLast");
			map.put("memberNo", memberNo);
			map.put("couponNo",couponNo);
			result2 += dao.dropCoupon(map);
			
			}
			
		}else if(result>0 && method==2 && type==2) {
			map  = dao.selectMemberNo(map);
			List list =(List) map.get("list");
			for(int i=0; i<list.size();i++) {
			String memberNo= (String)list.get(i);
			map.put("memberNo", memberNo);
			Member2 m = dao.selectOneMember(map);
			String dcResult = (String) map.get("dcResult");
			int idx = dcResult.indexOf("p");
			String dcString = dcResult.substring(0,idx);
			
			int dc = Integer.parseInt(dcString);
			
			int mPoint = m.getMemberPoint();
			
			
			int sum = mPoint+dc;
			
			map.put("sum", sum);
			map.put("dc",dc);
			result2 += dao.dropPoint(map);
			}
			
		
		
	}
			
		
		
		
		
		
	
		return result;
	}

	public int dropCoupon(HashMap<String, Object> map) {
		
		int result = dao.dropCoupon(map);
		return result;
	}

	public CouponPageData selectAllCoupon(HashMap<String, Object> map) {
		int numPerPage =10;
		int reqPage = (Integer)map.get("reqPage");
		
				//Integer.parseInt((String)map.get("reqPage")); 
		String gotothe = (String)map.get("gotothe");
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		map.put("start", start);
		map.put("end",end);
		
		
		ArrayList<Coupon> list = dao.selectAllCoupon(map);
		int totalCount = dao.selectCouponTotalCount(map);
		int totalPage=0;
		if(totalCount % numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/"+gotothe+".do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>"; 
				pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo +"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='"+gotothe+".do?reqPage=" + pageNo + "'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		CouponPageData cpd = new CouponPageData(list, pageNavi, totalCount);
		return cpd;

	}

	public int deleteCoupon(String couponNo) {
		int result = dao.deleteCoupon(couponNo);
		
		return result;
	}

	public int pointReset(String memberNo) {
		int result = dao.pointReset(memberNo);
		return result;
	}

	public Prev selectFreeCount(HashMap<String, Object> map) {
		Prev prev = dao.selectFreeCount(map);
		return prev;
	}

	public Prev selectFjr(HashMap<String, Object> map) {
		Prev count = dao.selectFjr(map);
		return count;
	}

	public Prev selectRecipeCount(HashMap<String, Object> map) {
		Prev recipe = dao.selectRecipeCount(map);
		
		return recipe;
	}

	public Prev selectJoinCount(HashMap<String, Object> map) {
		Prev join = dao.selectJoinCount(map);
		return join;
	}
	
	
	
}
