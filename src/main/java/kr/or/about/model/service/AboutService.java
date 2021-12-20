package kr.or.about.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.about.model.dao.AboutDao;

@Service
public class AboutService {
	@Autowired
	private AboutDao dao;
}
