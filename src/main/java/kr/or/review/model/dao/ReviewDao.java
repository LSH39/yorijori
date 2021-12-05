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
	private SqlSessionTemplate session;

	public ArrayList<Review> selectAllReview(int classNo) {
		// TODO Auto-generated method stub
		List<Review> list = session.selectList("review.selectAllReview", classNo);
		return (ArrayList<Review>)list;
	}
	
	
}
