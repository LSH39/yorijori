package kr.or.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.Member2;
import kr.or.admin.model.vo.MemberPageData;


@Service
public class AdminService {
	@Autowired
	AdminDao dao;
	
	public MemberPageData allMemberList(int reqPage) {
		int numPerPage =30;
		int end = reqPage*numPerPage;
		int start = end - numPerPage+1;
		
		ArrayList<Member2> list = dao.allMemberList();
		int totalCount = dao.selectTotalCount();

		int totalPage=0;

		if(totalCount % numPerPage==0) {

			totalPage = totalCount/numPerPage;

		}else {

			totalPage=totalCount/numPerPage+1;

		}

		

		int pageNaviSize = 5;

		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;

		String pageNavi = "<ul class='pagination pagination-lg'>";

		if(pageNo != 1) {

			pageNavi += "<li class='page-item'>";

			pageNavi += "<a class='page-link' href='/allmember.do?reqPage=" + (pageNo - 1) + "'>";

			pageNavi += "&lt;</a></li>";

		}

		for (int i = 0; i < pageNaviSize; i++) {

			if (pageNo == reqPage) {

				pageNavi += "<li class='page-item active'>";

				pageNavi += "<a class='page-link' href='/allmember.do?reqPage=" + pageNo + "'>";

				pageNavi += pageNo + "</a></li>";

			} else {

				pageNavi += "<li class='page-item'>"; 

				pageNavi += "<a class='page-link' href='/allmember.do?reqPage=" + pageNo + "'>";

				pageNavi += pageNo + "</a></li>";

			}

			pageNo++;

			if (pageNo > totalPage) {

				break;

			}

		}

		if (pageNo <= totalPage) {

			pageNavi += "<li class='page-item'>";

			pageNavi += "<a class='page-link' href='/allmember.do?reqPage=" + pageNo + "'>";

			pageNavi += "&gt;</a></li>";

		}

		pageNavi += "</ul>";

		

		MemberPageData mpd = new MemberPageData(list,pageNavi,start);

		

		return mpd;
		
		
	}
}
