package kr.or.cookingRsrv.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.cookingRsrv.model.dao.CookingRsrvDao;
import kr.or.cookingRsrv.model.vo.CookingRsrv;

@Service
public class CookingRsrvService {

	@Autowired
	private CookingRsrvDao dao;

	//예약 하기
	@Transactional
	public int insertCookingRsrv(int memberNo, int classNo, String impUid, int classNop) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("classNo", classNo);
		map.put("impUid", impUid);
		
		int result = 0;
		int classCnt = dao.currClsCnt(classNo); //db에서 현재 인원수 조회
		if(classNop > classCnt) {
			int result1 = dao.incCookingClsNop(classNo);
			result = dao.insertCookingRsrv(map);
			System.out.println(result);
			System.out.println(result1);
		}else {
			return -1;
		}
		
		return result;
	}

	//예약 내역 조회
	public ArrayList<CookingRsrv> selectAllRsrv(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<CookingRsrv> list = dao.selectAllRsrv(memberNo);
		return list;
	}

	//예약 취소
	@Transactional
	public int deleteCookingRsrv(int classNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteCookingRsrv(classNo);
		int result1 = dao.decCookingClsNop(classNo);
		return result;
	}

}
