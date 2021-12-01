package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.vo.Member2;



@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	public ArrayList<Member2> allMemberList() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member2>) list;
	}

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("member.selectTotalCount");
		return 0;
	}
}
