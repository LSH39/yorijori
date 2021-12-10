package kr.or.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.freeboard.model.dao.FreeboardDao;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.freeboard.model.vo.FreeboardPageData;

@Service
public class FreeboardService {
	@Autowired
	private FreeboardDao dao;
	
	public FreeboardPageData selectFreeList(int reqPage) {
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Freeboard> list = dao.selectFreeList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination tk-pagination'>";
		
		if(pageNo != 1) {
			pageNavi += "<li class=\"tk-page-item\">";
			pageNavi += "<a class=\"page-link\" href='/freeboardList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"tk-page-item active\">";
				pageNavi += "<a class='page-link' href='/freeboardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='tk-page-item'>";
				pageNavi += "<a class='page-link' href='/freeboardList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='tk-page-item'>";
			pageNavi += "<a class='page-link' href='/freeboardList?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		FreeboardPageData fpd = new FreeboardPageData(list,pageNavi,start,totalCount);
		return fpd;
	}

}
