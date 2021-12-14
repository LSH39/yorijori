package kr.or.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.main.model.dao.MainDao;
import kr.or.main.model.vo.MainSearchResult;

@Service
public class MainService {
	@Autowired
	private MainDao dao;

	public MainSearchResult mainpageSearch(int reqPage, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
}
