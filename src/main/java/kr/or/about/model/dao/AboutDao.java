package kr.or.about.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AboutDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
