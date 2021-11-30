package kr.or.milkit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.milkit.model.dao.MilkitDao;

@Service
public class MilkitService {
	@Autowired
	private MilkitDao dao;
	
}
