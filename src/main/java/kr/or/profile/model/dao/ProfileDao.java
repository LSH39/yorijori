package kr.or.profile.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProfileDao {

	@Autowired
	private SqlSessionTemplate session;
	
	
	
}
