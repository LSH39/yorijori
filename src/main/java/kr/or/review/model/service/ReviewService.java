package kr.or.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.review.model.dao.ReviewDao;
import kr.or.review.model.vo.Review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao dao;

	public ArrayList<Review> selectAllReview(int classNo) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = dao.selectAllReview(classNo);
		return list;
	}
}
