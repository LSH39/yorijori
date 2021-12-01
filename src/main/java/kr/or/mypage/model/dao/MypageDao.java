package kr.or.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
@Repository
public class MypageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*마이페이지*/
	public Member mypage(String memberId) {
		return sqlSession.selectOne("mypage.mypage",memberId);
	}
    /*회원정보수정*/
	public int updateMember(Member m) {
		return sqlSession.update("mypage.updateMember",m);

	}
	 /*회원탈퇴*/
	public int deleteMember(Member m) {
		return sqlSession.delete("mypage.deleteMember",m);
	}

}
