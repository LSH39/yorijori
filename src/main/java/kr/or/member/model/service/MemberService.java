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

	//로그인
	public Member loginMemberEnc(Member member){
		Member m;
		if(member.getMemberId().isEmpty() || member.getMemberPw().isEmpty()) {
			m = null;
		}else {
			System.out.println("암호화값 : "+member.getMemberPw());
			m = dao.loginMember(member);
		}
		return m;
	}
	
	
	
}
