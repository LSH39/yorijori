package kr.or.freeboard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;

import kr.or.freeboard.model.dao.FreeboardDao;
import kr.or.freeboard.model.vo.Freeboard;
import kr.or.freeboard.model.vo.FreeboardComment;
import kr.or.freeboard.model.vo.FreeboardCommentLike;
import kr.or.freeboard.model.vo.FreeboardFile;
import kr.or.freeboard.model.vo.FreeboardLike;
import kr.or.freeboard.model.vo.FreeboardPageData;
import kr.or.freeboard.model.vo.FreeboardViewData;

@Service
public class FreeboardService {
	@Autowired
	private FreeboardDao dao;
	
	public FreeboardPageData selectFreeList(int reqPage, int orderIndex) {
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("orderIndex", orderIndex);
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
			pageNavi += "<a class=\"page-link\" href='/freeboardList.do?reqPage="+(pageNo-1)+"&orderIndex="+orderIndex+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"tk-page-item active\">";
				pageNavi += "<a class='page-link' href='/freeboardList.do?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='tk-page-item'>";
				pageNavi += "<a class='page-link' href='/freeboardList.do?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='tk-page-item'>";
			pageNavi += "<a class='page-link' href='/freeboardList?reqPage="+pageNo+"&orderIndex="+orderIndex+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		FreeboardPageData fpd = new FreeboardPageData(list,pageNavi,start,totalCount);
		return fpd;
	}

	public FreeboardViewData selectOneFree(int freeNo) {
		dao.readCountUpdate(freeNo);
		ArrayList<FreeboardComment> commentList = dao.selectCommentList(freeNo);
		ArrayList<FreeboardFile> fileList = dao.selectFileList(freeNo);
		Freeboard fb = dao.selectOneFree(freeNo);
		FreeboardViewData fvd = new FreeboardViewData();
		fvd.setCommentList(commentList);
		fvd.setFileList(fileList);
		fvd.setFb(fb);
		fvd.setProfilePath(fb.getProfilePath());
		return fvd;
	}

	public int insertFreeboardLike(int freeNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("freeNo", freeNo);
		map.put("memberId", memberId);
		int result = dao.insertFreeboardLike(map);
		return result;
	}

	public int selectOneFreeLike(int freeNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("freeNo", freeNo);
		map.put("memberId", memberId);
		int result = dao.selectOneFreeLike(map);
		return result;
	}

	public int insertFreeboardComment(FreeboardComment fc) {
		int result = dao.insertFreeboardComment(fc);
		return result;
	}

	public int deleteFreeboardComment(int fcNo) {
		int result = dao.deleteFreeboardComment(fcNo);
		return result;
	}

	public int updateFreeboardComment(int fcNo, String fcContent) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fcNo", fcNo);
		map.put("fcContent", fcContent);
		int result = dao.updateFreeboardComment(map);
		return result;
	}


	public ArrayList<FreeboardLike> selectFcLikeList(String memberId, int freeNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("freeNo", freeNo);
		ArrayList<FreeboardLike> list = dao.selectFcLikeList(map);
		return list;
	}

	public int insertFcLike(int fcNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("fcNo", fcNo);
		int result = dao.insertFcLike(map);
		return result;
	}

	public int insertFreeboard(Freeboard f, ArrayList<FreeboardFile> list) {
		int result = dao.insertFreeboard(f);
		int fn = dao.selectFreeNo(f);
		int finalResult = 0;
		if(result>0) {
			for(int i=0; i<list.size(); i++) {
				list.get(i).setFreeNo(fn);
				int count = dao.insertFreeboardFile(list.get(i));
				finalResult += count;
			}
		} else {
			
		}
		return finalResult;
	}

		public FreeboardPageData selectFreeList(String searchtype, String searchword) {
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
				ArrayList<Freeboard> list = dao.searchFreeList(map);
				
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
					pageNavi += "<a class=\"page-link\" href='/freeboardList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
				}
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == 1) {
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
					pageNavi += "<a class='page-link' href='/freeboardList.do?reqPage="+pageNo+"'>";
					pageNavi += "&gt;</a></li>";
				}
				pageNavi += "</ul>";
				FreeboardPageData searchResult = new FreeboardPageData(list,pageNavi,start,totalCount);
				return searchResult;
		
	}

		public FreeboardFile getFreeboardFile(int ffNo) {
			FreeboardFile ff = dao.getFreeboardFile(ffNo);
			return ff;
		}

}
