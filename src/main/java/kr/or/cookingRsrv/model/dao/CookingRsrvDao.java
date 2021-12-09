package kr.or.cookingRsrv.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingRsrv.model.vo.CookingRsrv;

@Repository
public class CookingRsrvDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//예약 하기
	public int insertCookingRsrv(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cookingrsrv.insertCookingRsrv", map);
	}

	//쿠킹 클래스 현재 인원수
	public int currClsCnt(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cookingcls.selectCurrClsCnt", classNo);
	}

	//인원수 증가
	public int incCookingClsNop(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cookingcls.incCookingClsNop", classNo);
	}

	//예약 내역 조회
	public ArrayList<CookingRsrv> selectAllRsrv(String memberNickname) {
		// TODO Auto-generated method stub
		List<CookingRsrv> list = sqlSession.selectList("cookingrsrv.selectAllRsrv", memberNickname);
		return (ArrayList<CookingRsrv>) list;
	}

	//예약 취소 내역 삭제
	public int deleteCookingRsrv(int rsrvNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cookingrsrv.deleteCookingRsrv", rsrvNo);
	}
	
	//인원수 감소
	public int decCookingClsNop(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cookingcls.decCookingClsNop", classNo);
	}

	//쿠킹 클래스 예약 취소 (성승민 12-08)
	public int cancelCookingRsrv(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cookingrsrv.cancelCookingRsrv", classNo);
	}
}
