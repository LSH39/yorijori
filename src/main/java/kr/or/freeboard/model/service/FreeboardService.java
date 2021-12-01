package kr.or.freeboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.freeboard.model.dao.FreeboardDao;

public class FreeboardService {
	@Autowired
	private FreeboardDao dao;
}
