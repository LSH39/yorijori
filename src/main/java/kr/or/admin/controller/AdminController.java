package kr.or.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.CouponPageData;
import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.MemberPageData;
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
	
}
