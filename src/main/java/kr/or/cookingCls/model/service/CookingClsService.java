package kr.or.cookingCls.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.cookingCls.model.dao.CookingClsDao;
import kr.or.cookingCls.model.vo.CookingCls;

@Service
public class CookingClsService {

	@Autowired
	private CookingClsDao dao;

	//쿠킹클래스 조회
	public CookingCls selectOneClass(int classNo) {
		// TODO Auto-generated method stub
		CookingCls ccls = dao.selectOneClass(classNo);
		return ccls;
	}

	//쿠킹클래스 전체 조회
	public ArrayList<CookingCls> selectAllClass() {
		// TODO Auto-generated method stub
		ArrayList<CookingCls> list = dao.selectAllClass();
		return list;
	}
}
