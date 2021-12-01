package kr.or.freeboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class FreeboardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
