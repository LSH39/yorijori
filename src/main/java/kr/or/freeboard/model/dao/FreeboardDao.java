package kr.or.freeboard.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.freeboard.model.vo.Freeboard;

@Repository
public class FreeboardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Freeboard> selectFreeList(HashMap<String, Object> map) {
		List<Freeboard> list = sqlSession.selectList("freeboard.freeList", map);
		return (ArrayList<Freeboard>) list;
	}

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("freeboard.totalCount");
		return totalCount;
	}
}
