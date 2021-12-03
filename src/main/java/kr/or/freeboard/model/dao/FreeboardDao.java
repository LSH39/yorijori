package kr.or.freeboard.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeboardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
