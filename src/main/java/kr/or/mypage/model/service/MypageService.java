package kr.or.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.mypage.model.dao.MypageDao;
@Service
public class MypageService {
	@Autowired
	private MypageDao dao;
	
	public Member mypage(String memberId) {
		Member m =dao.mypage(memberId);
		return m;
	}

	public int upMember(Member m) {
		int result = dao.updateMember(m);
		return result;
	}

	public int deleteMember(Member m) {
		int result =dao.deleteMember(m);
		return result;
	}

}
