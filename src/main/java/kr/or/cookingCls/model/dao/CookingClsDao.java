package kr.or.cookingCls.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingCls.model.vo.CookingCls;

@Repository
public class CookingClsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public CookingCls selectOneClass(int classNo) {
		return sqlSession.selectOne("cookingcls.selectOneClass", classNo); //mqpper xml에서 설정한 namespace
	}

	public ArrayList<CookingCls> selectAllClass() {
		// TODO Auto-generated method stub
		List<CookingCls> list = sqlSession.selectList("cookingcls.selectList");
		return (ArrayList<CookingCls>) list;
	}
}
