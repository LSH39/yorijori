package kr.or.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dm.model.dao.DmDao;
import kr.or.dm.model.vo.Dm;

@Service
public class DmService {

	@Autowired
	private DmDao dao;

	//문의 리스트
	public ArrayList<Dm> selectAllDm(String dmSender, int memberLevel) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dmSender", dmSender);
		map.put("memberLevel", memberLevel);
		ArrayList<Dm> list = dao.selectAllDm(map);
		
		for(Dm dm : list) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("dmSender", dmSender);
			map1.put("dmRoomNo", dm.getDmRoomNo());
			System.out.println(dm.getDmRoomNo());
			
			int cnt = dao.selectDmCnt(map1); 
			System.out.println("안읽은개수 : "+cnt);
			dm.setDmCnt(cnt);
		}

		return list;
	}

	//문의 조회
	public ArrayList<Dm> selectOneDm(int classNo, String dmSender) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("classNo", classNo);
		map2.put("dmSender", dmSender);
		
		/*
		int dmRoomNo = 0;
		try {
			dmRoomNo  = dao.selectOneDmRoomNo(map);	
		}catch(Exception e){
			dmRoomNo = dao.incDmRoomNo();
			return dmRoomNo;
		}
		*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		int dmRoomNo = -1;
		try {
			dmRoomNo = dao.selectDmRoomNo2(map2);
		} catch(Exception e) {
			dmRoomNo = -1;
		}
		map.put("classNo", classNo);
		map.put("dmRoomNo", dmRoomNo);
		ArrayList<Dm> list = dao.selectOneDm(map);
		return list;
	}

	//문의 작성
	public int insertDm(int classNo, String dmReceiver, String dmSender, String dmContent, int dmRoomNo, String sessionNickname) {
		// TODO Auto-generated method stub
		if(sessionNickname.equals(dmReceiver)) {
			dmReceiver = dao.changeReceiver(dmRoomNo);
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("dmReceiver", dmReceiver);
		map.put("dmSender", dmSender);
		map.put("dmContent", dmContent);
		map.put("dmRoomNo", dmRoomNo);
		int result = dao.insertDm(map);
		return result;
	}
	
	//클래스 개설자 닉네임 찾기
	public String selectOneNickname(int classNo, String dmSender) {
		// TODO Auto-generated method stub
		String receiver = dao.selectOneNickname(classNo);

		return receiver;
	}
	


	//DM작성할때 보내는 사람이 클래스 개설한 사람인지 확인
	public String selectOneNickname(int classNo) {
		// TODO Auto-generated method stub
		String ClassNoNickname = dao.selectOneNickname(classNo);
		return ClassNoNickname;
	}


	//클래스 뷰에서 작성하는거
	@Transactional
	public int insertDm(int classNo, String dmReceiver, String dmSender, String dmContent, int dmRoomNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("dmReceiver", dmReceiver);
		map.put("dmSender", dmSender);
		map.put("dmContent", dmContent);
		map.put("dmRoomNo", dmRoomNo);
		int result = dao.insertDm(map);
		return result;
	}

	//클래스 뷰에서 ajax로 조회 하는거
	public ArrayList<Dm> selectOneDmList(int dmRoomNo) {
		// TODO Auto-generated method stub
		ArrayList<Dm> list2 = dao.selectOneDmList(dmRoomNo);		
		return list2;
	}

	//채팅방 번호 기준 조회(12-23)
	public ArrayList<Dm> selectOneDmAjax(int dmRoomNo, String dmSender) {
		// TODO Auto-generated method stub
		ArrayList<Dm> list = dao.selectOneDmAjax(dmRoomNo);
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("dmRoomNo", dmRoomNo);
		map.put("dmSender", dmSender);
		dao.updateReadflag(map);
		return list;
	}

	//클래스 뷰에서 바로 문의 (12-23)
	public ArrayList<Dm> selectOneDmAjaxList(int classNo, int dmRoomNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("dmRoomNo", dmRoomNo);
		ArrayList<Dm> list4 = dao.selectOneDmAjaxList(map);
		return list4;
	}
	
	//문의 최초 작성 할때 채팅방 번호 발급 (12-23)
	public int selectOneDmRoomNo(int classNo, String dmSender) {
		// TODO Auto-generated method stub
		int dmRoomNo = -1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classNo", classNo);
		map.put("dmSender", dmSender);
		try {
			dmRoomNo  = dao.selectOneDmRoomNo(map);	
		}catch(Exception e){
			dmRoomNo = dao.incDmRoomNo();
			return dmRoomNo;
		}
		return dmRoomNo;
	}

}
