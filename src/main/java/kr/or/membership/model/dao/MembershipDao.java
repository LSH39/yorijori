package kr.or.membership.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.membership.model.vo.Membership;
import kr.or.membership.model.vo.SubPayment;

@Repository
public class MembershipDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	public int insertMembership(Membership m) {
		return sqlSession.insert("membership.insertMembership", m);
	}

	public int selectMembershipNo() {
		return sqlSession.selectOne("membership.selectMembershipNo");
	}

	public int insertSubPayment(SubPayment sp) {
		return sqlSession.insert("membership.insertSubPayment",sp);
	}

	public int selectMembershipNo(int memberNo) {
		return sqlSession.selectOne("membership.selectMembership",memberNo);
	}
}
