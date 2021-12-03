package kr.or.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.main.model.dao.MainDao;

@Service
public class MainService {
	@Autowired
	private MainDao dao;
}
