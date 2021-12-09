package kr.or.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.review.model.service.ReviewService;
import kr.or.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	//해당 클래스에 대한 리뷰 전체 조회
	@RequestMapping(value="/reviewView.do")
	public String reviewList(int classNo, Model model) {
		ArrayList<Review> list = service.selectAllReview(classNo);
		model.addAttribute("list", list);
		return "review/reviewList";
	}
	
	//리뷰 작성 AJAX사용
	@ResponseBody
	@RequestMapping(value="/insertReview.do")
	public String insertReview(Review review, Model model) {
		int result = service.insertReview(review);
		if(result > 0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	
	//리뷰 삭제
	@RequestMapping(value="/reviewDelete.do")
	public String deleteReview(int reviewNo, Model model) {
		int result = service.deleteReview(reviewNo);
		if(result > 0) {
			model.addAttribute("msg", "삭제 성공");
			model.addAttribute("loc", "/cookingClsList.do?reqPage=1");
		}else {
			model.addAttribute("msg", "삭제 실패!");
			model.addAttribute("loc", "/");			
		}
		return "common/msg";
	}
}
