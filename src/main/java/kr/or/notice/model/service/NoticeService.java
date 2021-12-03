package kr.or.notice.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.notice.model.dao.NoticeDao;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
}
