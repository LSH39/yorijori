package kr.or.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.point.model.dao.PointDao;

@Service
public class PointService {
	@Autowired
	private PointDao dao;
}
