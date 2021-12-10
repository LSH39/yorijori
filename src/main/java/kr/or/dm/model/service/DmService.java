package kr.or.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dm.model.dao.DmDao;
import kr.or.dm.model.vo.Dm;

@Service
public class DmService {

	@Autowired
	private DmDao dao;

	//문의 리스트
	public ArrayList<Dm> selectAllDm() {
		// TODO Auto-generated method stub
		ArrayList<Dm> list = dao.selectAllDm();
		return list;
	}

	//문의 조회
	public ArrayList<Dm> selectOneDm(int classNo) {
		// TODO Auto-generated method stub
		ArrayList<Dm> list = dao.selectOneDm(classNo);
		return list;
	}

	//문의 작성
	public int insertDm(int classNo, String dmReceiver, String dmSender, String dmContent) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("dmReceiver", dmReceiver);
		map.put("dmSender", dmSender);
		map.put("dmContent", dmContent);
		int result = dao.insertDm(map);
		return result;
	}
	
	//클래스 개설자 닉네임 찾기
	public String selectOneNickname(int classNo) {
		// TODO Auto-generated method stub
		String receiver = dao.selectOneNickname(classNo);
		return receiver;
	}
}
