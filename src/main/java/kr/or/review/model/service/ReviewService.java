package kr.or.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.review.model.dao.ReviewDao;
import kr.or.review.model.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao dao;

	//해당 클래스에 대한 리뷰 조회
	public ArrayList<Review> selectAllReview(int classNo) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = dao.selectAllReview(classNo);
		return list;
	}

	
	//insert 할거니까 commit rollback은 이게필요
	//리뷰 작성
	@Transactional
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		int result = dao.insertReview(review);
		return result;
	}

	//리뷰 삭제
	@Transactional
	public int deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteReview(reviewNo);
		return result;
	}
}
