package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.Member;


@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member member) {
		Member m = sqlSession.selectOne("member.loginMember",member);
		return m;
	}
	
	public int joinSearch(Member member) {
		String resultNo = sqlSession.selectOne("member.joinSearch",member);
		int memberNo = 0;
		if(resultNo != null) {
			memberNo = Integer.parseInt(resultNo);
		}else {
			memberNo = 0;
		}
		return memberNo;
	}

	public int joinAdmin(Member member) {
		return sqlSession.insert("member.joinAdmin",member);
	}
	
	public int joinBasic(Member member) {
		return sqlSession.insert("member.joinBasic",member);
	}
	
	public int joinPro(Member member) {
		return sqlSession.insert("member.joinPro",member);
	}

	public int joinCoupon(Member member) {
		return sqlSession.insert("member.joinCoupon",member);
	}

	public Member findIdPw(Member member) {
		return sqlSession.selectOne("member.findIdPw",member);
	}

	public int findPwRe(Member member) {
		return sqlSession.update("member.findPwRe",member);
	}

	public int deleteMember(Member member) {
		return sqlSession.delete("member.deleteMember1",member);
	}

	public int upSeller(Member member) {
		return sqlSession.update("member.upSeller",member);
	}
	
}
