package kr.or.cookingCls.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CookingClsDao {

	@Autowired
	private SqlSessionTemplate session;
}
