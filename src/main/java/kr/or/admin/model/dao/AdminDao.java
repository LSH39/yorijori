package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	public ArrayList<Member2> allMemberList(String searchType, String searchText) {
		List list = null;
		if(searchText ==null) {
			list = sqlSession.selectList("member.selectAllMember");
		}else {
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("searchType", searchType);
			map.put("searchText", searchText);
			
			list = sqlSession.selectList("member.selectOneMember",map);
			
		}
		
		return (ArrayList<Member2>) list;
	}

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("member.selectTotalCount");
		return 0;
	}
}
