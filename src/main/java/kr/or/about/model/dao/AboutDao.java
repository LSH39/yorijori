package kr.or.about.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.about.model.vo.FoodList;

@Repository
public class AboutDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int foodTotalCount() {
		return sqlSession.selectOne("about.foodTotalCount");
	}
	
	public int foodCount(FoodList f) {
		return sqlSession.selectOne("about.foodCount",f);
	}
	
	public FoodList foodList(FoodList f) {
		return sqlSession.selectOne("about.foodList", f);
	}


}
