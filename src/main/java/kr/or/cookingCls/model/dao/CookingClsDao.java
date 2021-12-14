package kr.or.cookingCls.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingCls.model.vo.CookingClsPicVO;
import kr.or.review.model.vo.Review;

@Repository
public class CookingClsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//쿠킹 클래스 조회
	public CookingCls selectOneClass(int classNo) {
		return sqlSession.selectOne("cookingcls.selectOneClass", classNo); //mqpper xml에서 설정한 namespace
	}

	//쿠킹 클래스 전체 조회
	public ArrayList<CookingCls> selectAllClass(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<CookingCls> list = sqlSession.selectList("cookingcls.selectClassList", map);
		return (ArrayList<CookingCls>) list;
	}

	//쿠킹 클래스 게시물 개수
	public int totalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cookingcls.totalCount");
	}

	//쿠킹 클래스 리뷰 목록 조회
	public ArrayList<Review> selectReviewList(int classNo) {
		// TODO Auto-generated method stub
		List<Review> list = sqlSession.selectList("review.selectAllReview", classNo);
		return (ArrayList<Review>)list;
	}

	//리뷰 점수
	public double avgReviewRate(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.avgReviewRate", classNo);
	}

	//쿠킹 클래스 삭제
	public int deleteOneClass(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("cookingcls.deleteOneClass", classNo);
	}

	public int selectOneDmRoomNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("", map);
	}

	//쿠킹 클래스 작성
	public int insertCookingCls(CookingCls ccls) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cookingcls.insertCookingCls", ccls);
	}

	//쿠킹 클래스 파일 처무
	public int insertFile(CookingClsPicVO ccpvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cookingcls.insertFile", ccpvo);
	}

	//쿠킹 클래스 수정
	public int updateOneClass(CookingCls ccls) {
		// TODO Auto-generated method stub
		return sqlSession.update("cookingcls.updateCookingCls", ccls);
	}
}
