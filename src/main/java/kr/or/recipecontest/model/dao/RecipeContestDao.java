package kr.or.recipecontest.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeContestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
