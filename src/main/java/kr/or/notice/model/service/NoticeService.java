package kr.or.notice.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.notice.controller.NoticePageData;
import kr.or.notice.model.dao.NoticeDao;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public NoticePageData selectNoticeList(int reqPage) {
		
		//필요한 정보 - 페이지당 게시물 개수 / 
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		return null;
	}
}
