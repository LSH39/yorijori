package kr.or.dm.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dm.model.dao.DmDao;

@Service
public class DmService {

	@Autowired
	private DmDao dao;
}
