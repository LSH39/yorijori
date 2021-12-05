package kr.or.dm.model.service;

import java.util.ArrayList;

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
	public ArrayList<Dm> selectOneDm(int memberNo) {
		// TODO Auto-generated method stub
		ArrayList<Dm> list = dao.selectOneDm(memberNo);
		return list;
	}
}
