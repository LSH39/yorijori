package kr.or.recipecontest.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipecontest.model.dao.RecipeContestDao;
import kr.or.recipecontest.model.vo.ContestPageData;
import kr.or.recipecontest.model.vo.ContestViewData;
import kr.or.recipecontest.model.vo.RecipeContest;

@Service
public class RecipeContestService {
	@Autowired
	private RecipeContestDao dao;

	public ContestPageData selectContestList(int reqPage, int orderIndex) {
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 12;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("orderIndex", orderIndex);
	
		ArrayList<RecipeContest> list = dao.selectContestList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.selectTotalCount();
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 4;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination tk-pagination'>";
		
		if(pageNo != 1) {
			pageNavi += "<li class=\"tk-page-item\">";
			pageNavi += "<a class=\"page-link\" href='/contestList?reqPage="+(pageNo-1)+"&orderIndex="+orderIndex+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"tk-page-item active\">";
				pageNavi += "<a class='page-link' href='/contestList?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='tk-page-item'>";
				pageNavi += "<a class='page-link' href='/contestList?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='tk-page-item'>";
			pageNavi += "<a class='page-link' href='/contestList?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		ContestPageData cpd = new ContestPageData(list,pageNavi,start,totalCount, orderIndex);
		return cpd;
	}

	public int voteCheck(int memberNo) {
		int result = dao.voteCheck(memberNo);
		int contestNo = 0;
		if(result>0) { //투표한 이력이 있을 경우
			contestNo = dao.selectContestNo(memberNo);
		}
		return contestNo;
	}

	public int insertVote(int memberNo, int contestNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("contestNo", contestNo);
		int result = dao.insertVote(map);
		return result;
	}

	public ContestPageData selectContestList(String searchtype, String searchword) {
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 10;
		int end = 1 * numPerPage;
		int start = end - numPerPage + 1;
		
		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		ArrayList<RecipeContest> list = dao.searchContestList(map);
		
		//페이지 네비게이션 제작
		int totalCount = dao.selectTotalCount(searchtype, searchword);
		int totalPage = 0;
		
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((1-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination tk-pagination'>";
		
		if(pageNo != 1) {
			pageNavi += "<li class=\"tk-page-item\">";
			pageNavi += "<a class=\"page-link\" href='/contestList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == 1) {
				pageNavi += "<li class=\"tk-page-item active\">";
				pageNavi += "<a class='page-link' href='/contestList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='tk-page-item'>";
				pageNavi += "<a class='page-link' href='/contestList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='tk-page-item'>";
			pageNavi += "<a class='page-link' href='/contestList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		ContestPageData searchResult = new ContestPageData(list,pageNavi,start,totalCount);
		return searchResult;
	}

	public ArrayList<ContestViewData> selectRecipeList(int memberNo, int year, int month) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("year", year);
		map.put("month", month);
		ArrayList<ContestViewData> list = dao.selectRecipeList(map);
		return list;
	}

	public int contestEnter(int recipeNo, int memberNo, int enteredNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("recipeNo", recipeNo);
		int result = 0;
		if(enteredNo > 0) {
			int del = dao.deleteContestRecipe(enteredNo);
			if(del>0) {
				result = dao.insertContestRecipe(map);
			}
		}
			result = dao.insertContestRecipe(map);
		return result;
	}

	public ArrayList<RecipeContest> selectContestRecipeList() {
		ArrayList<RecipeContest> list = dao.selectContestRecipeList();
		return list;
	}

}
