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
	public int insertCookingRsrv(String memberNickname, int classNo, String impUid, int classNop) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNickname", memberNickname);
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
	public ArrayList<CookingRsrv> selectAllRsrv(String memberNickname) {
		// TODO Auto-generated method stub
		ArrayList<CookingRsrv> list = dao.selectAllRsrv(memberNickname);
		return list;
	}

	//예약 취소 내역 삭제
	@Transactional
	public int deleteCookingRsrv(int rsrvNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteCookingRsrv(rsrvNo);
		return result;
	}

	//쿠킹 클래스 예약 취소 (성승민 12-08)
	@Transactional
	public int cancelCookingRsrv(int classNo) {
		// TODO Auto-generated method stub
		int result = dao.cancelCookingRsrv(classNo);
		int result1 = dao.decCookingClsNop(classNo);				
		return result;
	}

}
