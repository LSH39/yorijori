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
		System.out.println("1 : "+member.getMemberId() + member.getMemberPw());
		Member m = sqlSession.selectOne("member.loginMember",member);
		System.out.println("2 : "+m.getMemberId() + m.getMemberPw());
		return m;
	}
	
	
	
	
}
