package kr.or.dm.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
