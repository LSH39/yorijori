package kr.or.about.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.about.model.vo.FoodList;

@Repository
public class AboutDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int foodTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int foodCount(FoodList f) {
		// TODO Auto-generated method stub
		return 0;
	}

	public FoodList foodList(FoodList f) {
		// TODO Auto-generated method stub
		return null;
	}


}
