package kr.or.admin.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.CouponPageData;
import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.MemberPageData;
import kr.or.admin.model.vo.Prev;
import kr.or.coupon.model.vo.Coupon;




@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	
	@RequestMapping(value="/admin.do")
	public String admin() {
		return "admin/admin";
	}
	@RequestMapping(value="/allmember.do")
	public String allmember(Model model,int reqPage,String searchType,String searchText,String searchDetail,String period,String start,String end,String moreless,String joinStart,String joinEnd,String detail,String align,String memberLevel,String searchText2) {
		int level = 0;
		String gotothe = "allmember";
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText,searchDetail,period,start,end,moreless,joinStart,joinEnd,detail,align,memberLevel,searchText2,level,gotothe);
		model.addAttribute("list" ,mpd.getList());
		model.addAttribute("totalCount",mpd.getTotalCount());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/allmember";
	}
	@ResponseBody
	@RequestMapping(value="/addBlackMember.do")
	public String addBlackMember(String memberNo) {
		
		int result = service.addBlackMember(memberNo);
		return "redirect:/allmember.do?reqPage=1";
	}
	
	@RequestMapping(value="/blackList.do")
	public String blackList(Model model,int reqPage,String searchType,String searchText,String searchDetail,String period,String start,String end,String moreless,String joinStart,String joinEnd,String detail,String align,String memberLevel,String searchText2) {
		int level = 1;
		String gotothe = "blackList";
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText,searchDetail,period,start,end,moreless,joinStart,joinEnd,detail,align,memberLevel,searchText2,level,gotothe);
		model.addAttribute("list" ,mpd.getList());
		model.addAttribute("totalCount",mpd.getTotalCount());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/blackList";
	}
	@RequestMapping(value="/permissionJoin.do")
	public String permissionJoin(Model model,int reqPage,String searchType,String searchText,String searchDetail,String period,String start,String end,String moreless,String joinStart,String joinEnd,String detail,String align,String memberLevel,String searchText2) {
		int level = 0;
		String gotothe = "permissionJoin";
		memberLevel = "4";
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText,searchDetail,period,start,end,moreless,joinStart,joinEnd,detail,align,memberLevel,searchText2,level,gotothe);
		model.addAttribute("list" ,mpd.getList());
		model.addAttribute("totalCount",mpd.getTotalCount());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/permissionJoin";
	}
	
	@RequestMapping(value="/permissionDelete.do")
	public String permissionDelete(Model model,int reqPage,String searchType,String searchText,String searchDetail,String period,String start,String end,String moreless,String joinStart,String joinEnd,String detail,String align,String memberLevel,String searchText2) {
		int level = 0;
		String gotothe = "permissionDelete";
		memberLevel = "5";
		MemberPageData mpd =  service.allMemberList(reqPage,searchType,searchText,searchDetail,period,start,end,moreless,joinStart,joinEnd,detail,align,memberLevel,searchText2,level,gotothe);
		model.addAttribute("list" ,mpd.getList());
		model.addAttribute("totalCount",mpd.getTotalCount());
		model.addAttribute("pageNavi",mpd.getPageNavi());
		
		return "admin/permissionDelete";
	}
	
	@ResponseBody
	@RequestMapping(value="/addNormalMember.do")
	public String addNormalMember(String memberNo) {
		int result = service.addNormalMember(memberNo);
		return "redirect:/allmember.do?reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/adminDeleteMember.do")
	public String deleteMember(String memberNo) {
		int result = service.deleteMember(memberNo);
		return "redirect:/allmember.do?reqPage=1";
	}
	@ResponseBody
	@RequestMapping(value="/addJori.do")
	public String addJori(String memberNo) {
		int result = service.addJori(memberNo);
		return "redirect:/permissionJoin.do?reqPage=1";
	}
	@RequestMapping(value="/coupon.do")
	public String coupon() {
		return "admin/coupon";
	}
	@RequestMapping(value="/createCoupon.do")
	public String createCoupon(String couponName,String who,String type,String method,String limit, String amount,String dcResult,String limitDate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("couponName", couponName);
		map.put("who", who);
		map.put("type", type);
		map.put("method", method);
		map.put("limit", limit);
		map.put("limitDate", limitDate);
		map.put("amount", amount);
		map.put("dcResult", dcResult);
		
		int result1 = service.createCoupon(map);
		
			
			
		return "admin/coupon";
	}
	@RequestMapping(value="/couponList.do")
	public String couponList(Model model, int reqPage  ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String gotothe = "couponList";
		
		map.put("gotothe", gotothe);
		map.put("reqPage", reqPage);
		
		CouponPageData cpd = service.selectAllCoupon(map);
		model.addAttribute("list",cpd.getList());
		model.addAttribute("pageNavi",cpd.getPageNavi());
		model.addAttribute("totalCount",cpd.getStart());
		return "admin/couponList";
	}
	
	@ResponseBody
	@RequestMapping(value="/adminDeleteCoupon.do")
	public String adminDeleteCoupon(String couponNo) {
		int result = service.deleteCoupon(couponNo);
		return "redirect:/couponList.do?reqPage=1";
	}
	@ResponseBody
	@RequestMapping(value="/pointReset.do")
	public String pointReset(String memberNo) {
		int result = service.pointReset(memberNo);
		return "redirect:/blackList.do?reqPage=1";
	}
	@RequestMapping(value="/stat.do")
	public String stat(Model model,String today) {
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today2 = sdf.format(date);
		if(today ==null) {
			today=today2;
		}
		
		Calendar g = new GregorianCalendar();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int year = g.get(Calendar.YEAR);
		int month = (g.get(Calendar.MONTH)+1);
		int intday = g.get(Calendar.DAY_OF_MONTH);
		String day = ""+intday;
		if(intday<10) {
			day = "0"+intday;
		}
		
		String gToday = year+"-"+month+"-"+day;
		
		
		
		
		int i =0;
		while(true) {
			
			
			g.add(Calendar.DATE, -i);
			year = g.get(Calendar.YEAR);
			month = (g.get(Calendar.MONTH)+1);
			intday = g.get(Calendar.DAY_OF_MONTH);
			day = ""+intday;
			if(intday<10) {
				day = "0"+intday;
			}
			gToday = year+"-"+month+"-"+day;
			
			if(today.equals(gToday) ) {
				map.put("today", gToday);
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				map.put("prev1day", gToday);
				
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				
				map.put("prev2day", gToday);
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				
				map.put("prev3day", gToday);
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				
				map.put("prev4day", gToday);
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				
				map.put("prev5day", gToday);
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				map.put("prev6day", gToday);
				
				g.add(Calendar.DATE, -1);
				year = g.get(Calendar.YEAR);
				month = (g.get(Calendar.MONTH)+1);
				intday = g.get(Calendar.DAY_OF_MONTH);
				day = ""+intday;
				if(intday<10) {
					day = "0"+intday;
				}
				gToday = year+"-"+month+"-"+day;
				map.put("prev7day", gToday);
				
				break;
			}else {
				i=1;
			}
			
		}
		
		
		
		
		
		
		
		Prev count = service.selectFjr(map);
		
		Prev prev = service.selectFreeCount(map);
		Prev recipe = service.selectRecipeCount(map);
		Prev join = service.selectJoinCount(map);
		model.addAttribute("freeCount",count.getToday());
		model.addAttribute("joinCount",count.getPrev1());
		model.addAttribute("recipeCount",count.getPrev2());
		model.addAttribute("p",prev);
		model.addAttribute("r",recipe);
		model.addAttribute("j",join);
		model.addAttribute("day",map);
		model.addAttribute("today",today);
		return "admin/stat";
	}
	
}
