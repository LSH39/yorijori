package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.dm.model.vo.Dm;

@Repository
public class DmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//문의 목록
	public ArrayList<Dm> selectAllDm() {
		// TODO Auto-generated method stub
		List<Dm> list = sqlSession.selectList("direct.dmList");
		return (ArrayList<Dm>)list;
	}

	//문의 조회
	public ArrayList<Dm> selectOneDm(int classNo) {
		// TODO Auto-generated method stub
		List<Dm> list = sqlSession.selectList("direct.selectOneDm", classNo) ;
		return (ArrayList<Dm>) list; 
	}

	//문의 작성
	public int insertDm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("direct.insertDm", map);
	}

	//클래스 개설자 닉네임 찾음
	public String selectOneNickname(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cookingcls.selectOneNickname", classNo);
	}
}
