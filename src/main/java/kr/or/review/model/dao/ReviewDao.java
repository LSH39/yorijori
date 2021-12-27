package kr.or.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.review.model.vo.Review;

@Repository
public class ReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//클래스에 대한 리뷰 전체 조회
	public ArrayList<Review> selectAllReview(int classNo) {
		// TODO Auto-generated method stub
		List<Review> list = sqlSession.selectList("review.selectAllReview", classNo);
		return (ArrayList<Review>)list;
	}

	//리뷰 작성
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.insertReview", review);
	}

	//리뷰 삭제
	public int deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review.deleteReview", reviewNo);
	}

	//점수 갱신
	public void updateReviewAvgRate(int classNo) {
		// TODO Auto-generated method stub
		sqlSession.update("cookingcls.updateReviewAvgRate", classNo);
		
	}

	//클래스조회
	public int selectClassNo(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("review.selectClassNo", classNo);
	}

	//밀키트 리뷰 작성 AJAX사용
	public int insertPurchaseReview(Review review) {
		// TODO Auto-generated method stub
		return sqlSession.insert("review.insertPurchaseReview", review);
	}

	//밀키트 리뷰 삭제 AJAX사용
	public int deletePurchaseReview(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("deletePurchaseReview", reviewNo);
	}
	
	
}
