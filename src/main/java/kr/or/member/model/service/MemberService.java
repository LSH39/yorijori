package kr.or.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;


@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member loginMemberEnc(Member member){
		Member m;
		if(member.getMemberId().isEmpty() || member.getMemberPw().isEmpty()) {
			m = null;
		}else {
			m = dao.loginMember(member);
		}
		return m;
	}
	
	public String joinSearch(Member member) {
		return dao.joinSearch(member);
	}

	public int joinAdminEnc(Member member, String domain) {
		String memberEmail = member.getMemberEmail()+"@"+domain;
		member.setMemberEmail(memberEmail);
		int result = dao.joinAdmin(member);
		return result;
	}

	public int joinBasicEnc(Member member, String domain) {
		String memberEmail = member.getMemberEmail()+"@"+domain;
		member.setMemberEmail(memberEmail);
		int result1 = dao.joinBasic(member);
		int result2 = 0;
		if(result1>0) {
			result2 = dao.joinCoupon(member);
		}
		return result2;
	}
	
	public int joinProEnc(Member member, String domain) {
		String memberEmail = member.getMemberEmail()+"@"+domain;
		member.setMemberEmail(memberEmail);
		int result1 = dao.joinPro(member);
		int result2 = 0;
		if(result1>0) {
			result2 = dao.joinCoupon(member);
		}
		return result2;
	}

	public Member findIdPw(Member member) {
		return dao.findIdPw(member);
	}

	public int findPwReEnc(Member member) {
		return dao.findPwRe(member);
	}

	
	
	
}
