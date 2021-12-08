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

	//리부 삭제
	public int deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("review.deleteReview", reviewNo);
	}
	
	
}
