package kr.or.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.notice.model.dao.NoticeDao;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;
import kr.or.notice.model.vo.NoticeViewData;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public NoticePageData selectNoticeList(int reqPage) {
		
		//필요한 정보 - 페이지당 게시물 개수
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//한 페이지에 보여줄 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectNoticeList(map);
		
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
			pageNavi += "<a class=\"page-link\" href='/noticeList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++){
			if(pageNo == reqPage) {
				pageNavi += "<li class=\"tk-page-item active\">";
				pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			} else {
				pageNavi += "<li class='tk-page-item'>";
				pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li class='tk-page-item'>";
			pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		NoticePageData npd = new NoticePageData(list,pageNavi,start,totalCount);
		return npd;
	}

	public Notice selectOneNotice(int noticeNo) {
		dao.readCountUpdate(noticeNo);
		Notice n = dao.selectOneNotice(noticeNo);
		return n;
	}

	public int deleteNotice(int noticeNo) {
		int result = dao.deleteNotice(noticeNo);
		return result;
	}

	public int insertNotice(Notice n) {
		int result = dao.insertNotice(n);
		return result;
	}

	public Notice viewOneNotice(int noticeNo) {
		dao.readCountUpdate(noticeNo);
		Notice n = dao.selectOneNotice(noticeNo);
		return n;
	}

	public Notice getNotice(int noticeNo) {
		Notice n = dao.selectOneNotice(noticeNo);
		return n;
	}

	public NoticeViewData selectNoticeViewData(int noticeNo) {
		dao.readCountUpdate(noticeNo);
		Notice n = dao.selectOneNotice(noticeNo);
		int pn = dao.selectPrevNo(noticeNo);
		int nn = dao.selectNextNo(noticeNo);
		Notice prevNotice = dao.selectOneNotice(pn);
		Notice nextNotice = dao.selectOneNotice(nn);
		NoticeViewData nvd = new NoticeViewData();
		nvd.setN(n);
		nvd.setPNo(pn);
		nvd.setNNo(nn);
		nvd.setPn(prevNotice);
		nvd.setNn(nextNotice);
		return nvd;
	}

	public NoticePageData selectNoticeList(String searchtype, String searchword) {
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
				ArrayList<Notice> list = dao.searchNoticeList(map);
				
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
					pageNavi += "<a class=\"page-link\" href='/noticeList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
				}
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == 1) {
						pageNavi += "<li class=\"tk-page-item active\">";
						pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='tk-page-item'>";
						pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='tk-page-item'>";
					pageNavi += "<a class='page-link' href='/noticeList.do?reqPage="+pageNo+"'>";
					pageNavi += "&gt;</a></li>";
				}
				pageNavi += "</ul>";
				NoticePageData searchResult = new NoticePageData(list,pageNavi,start,totalCount);
				return searchResult;
		
	}
}
