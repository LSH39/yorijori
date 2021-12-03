package kr.or.cookingCls.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingCls.model.dao.CookingClsDao;

@Service
public class CookingClsService {

	@Autowired
	private CookingClsDao dao;
}
