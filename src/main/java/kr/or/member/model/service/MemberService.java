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

	public Member loginMember(Member member){
		Member m;
		if(member.getMemberId().isEmpty() || member.getMemberPw().isEmpty()) {
			m = null;
		}else {
			
			// 나중에 수정하기.
			String pw = member.getMemberPw();
			if(pw.equals("333")) {
				member.setMemberPw("333                                                             ");
			}else if(pw.equals("z")) {
				member.setMemberPw("z                                                               ");
			}else if(pw.equals("x")) {
				member.setMemberPw("x                                                               ");
			}
			/*
			if(pw.length() <64) {
				for(int i=0;i<64-pw.length();i++) {
					pw += " ";
				}
				member.setMemberPw(pw);
				System.out.println("pw : "+pw);
				System.out.println(member.getMemberPw());
			}
			*/
			
			m = dao.loginMember(member);
		}
		return m;
	}
	
}
