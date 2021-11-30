package kr.or.mlikit.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.mlikit.model.dao.MilkitDao;

@Service
public class MilkitService {
	@Autowired
	private MilkitDao dao;
	
}
