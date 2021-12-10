package kr.or.cookingCls.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingCls.model.dao.CookingClsDao;
import kr.or.cookingCls.model.vo.CookingCls;
import kr.or.cookingCls.model.vo.CookingClsPageData;
import kr.or.review.model.vo.Review;

@Service
public class CookingClsService {

	@Autowired
	private CookingClsDao dao;

	//쿠킹 클래스 조회
	public CookingCls selectOneClass(int classNo) {
		// TODO Auto-generated method stub
		CookingCls ccls = dao.selectOneClass(classNo);
		return ccls;
	}

	//쿠킹 클래스 전체 조회
	public CookingClsPageData selectAllClass(int reqPage) {
		// TODO Auto-generated method stub
		
		int numPerPage = 1;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<CookingCls> list = dao.selectAllClass(map);
		
		int totalCount = dao.totalCount();
		
		int totalPage = 0;
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = (totalCount/numPerPage)+1;			
		}
		
		int pageNaviSize = 5; //1~5, 6~10, 11~15 이런식으로
//		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize +1;
		int pageNo = 0;
		if(reqPage>0 && reqPage<totalPage-4) {
			pageNo = reqPage;
		}else {
			pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize +1;
		}
		
		//페이지 네비 제작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		
		//이전 버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/cookingClsList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		
		//페이지 숫자 생성
		for (int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/cookingClsList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/cookingClsList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		//다음 버튼 생성
		if(pageNo < totalPage) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/cookingClsList.do?reqPage="+(reqPage+1)+"'>&gt;</a></li>";
		}
		
		pageNavi +="<ul>";
		
		CookingClsPageData ccpd = new CookingClsPageData(list, pageNavi, start);
		return ccpd;
	}
	
	//리뷰 목록 조회
	public ArrayList<Review> selectReviewList(int classNo) {
		// TODO Auto-generated method stub
		ArrayList<Review> list = dao.selectReviewList(classNo);
		return list;
	}

	//리뷰 점수 평균
	public double avgReviewRate(int classNo) {
		// TODO Auto-generated method stub
		double reviewAvg = dao.avgReviewRate(classNo);
		return reviewAvg;
	}

	//쿠킹 클래스 삭제
	public int deleteOneClass(int classNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteOneClass(classNo);
		return result;
	}

	public int selectOneDmRoomNo(int classNo, String memberNickname) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("memberNickname", memberNickname);
		int dmRoomNo = dao.selectOneDmRoomNo(map);
		return dmRoomNo;
	}
}
