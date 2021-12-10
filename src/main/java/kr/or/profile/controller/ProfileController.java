package kr.or.profile.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.vo.Member;
import kr.or.mypage.model.vo.Follow;
import kr.or.profile.model.service.ProfileService;
import kr.or.recipe.model.vo.RecipeBoard;


@Controller
public class ProfileController {

	@Autowired
	private ProfileService service;
	
	//프로필 화면으로 이동
	@RequestMapping(value="/profile.do")
	public String Profile(String memberId, HttpSession session, Model model) {
		Member member = service.selectOneProfile(memberId);
		int memberNo = member.getMemberNo();
		int follow = service.selectOneFollow(memberNo);
		int follower = service.selectOneFollower(memberNo);
		int rbCnt = service.selectOneReceipeCnt(memberNo);
		ArrayList<RecipeBoard> list = service.selectAllList(memberNo);
		Member mm = (Member)session.getAttribute("m");
		Follow fl = new Follow();
		if(mm != null) {
			int myMemberNo = mm.getMemberNo();
			fl = service.checkOneFollow(memberNo, myMemberNo);			
			model.addAttribute("fl", fl);
		}
		model.addAttribute("member", member);
		model.addAttribute("follow", follow);
		model.addAttribute("follower", follower);
		model.addAttribute("rbCnt", rbCnt);
		model.addAttribute("list", list);
		return "mypage/profile";
	}
	
	
	//Ajax 사용해서 팔로우
	@ResponseBody
	@RequestMapping(value="/profileFollow.do")
	public int ProfileFollow(int memberNo, int myMemberNo) {
		//팔로우 여부 확인 위해 우선 조회부터
		Follow fl = service.checkOneFollow(memberNo, myMemberNo);
		if(fl == null) {
			int result = service.insertFollow(memberNo, myMemberNo);
			return result;			
		} else {
			return -1;
		}
	}
	
	//Ajax 사용해서 언팔로우
	@ResponseBody
	@RequestMapping(value="/profileUnfollow.do")
	public int ProfileUnfollow(int memberNo, int myMemberNo) {
		Follow fl = service.checkOneFollow(memberNo, myMemberNo);
		//팔로우 여부 확인 위해 우선 조회부터
		if(fl != null) {
			int result = service.deleteFollow(memberNo, myMemberNo);
			return result;
		}else {
			return -1;			
		}
	}
	
	
}
