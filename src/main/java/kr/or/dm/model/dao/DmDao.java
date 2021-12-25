package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.dm.model.vo.Dm;

@Repository
public class DmDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//문의 목록
	public ArrayList<Dm> selectAllDm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Dm> list = sqlSession.selectList("direct.dmList", map);
		return (ArrayList<Dm>)list;
	}

	//문의 조회
	public ArrayList<Dm> selectOneDm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Dm> list = sqlSession.selectList("direct.selectOneDm", map) ;
		return (ArrayList<Dm>) list; 
	}

	//문의 작성
	public int insertDm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("direct.insertDm", map);
	}

	//클래스 개설자 닉네임 찾음
	public String selectOneNickname(int classNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cookingcls.selectOneNickname", classNo);
	}
	




	//dm조회할때 dm 채팅방 번호 가져옴
	public int selectDmRoomNo2(HashMap<String, Object> map2 ) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("direct.selectDmRoomNo2", map2);
	}

	//클래스 개설자 입장에서 받은 닉네임 확인
	public String changeReceiver(int dmRoomNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("direct.changeReceiver", dmRoomNo);
	}

	//문의 목록에서 조회하는거(12-23)
	public ArrayList<Dm> selectOneDmAjax(int dmRoomNo) {
		// TODO Auto-generated method stub
		List<Dm> list = sqlSession.selectList("direct.selectOneDmAjax", dmRoomNo);
		return (ArrayList<Dm>)list;
	}

	//읽음 처리 하는거(12-23)
	public void updateReadflag(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("updateReadflag", map);
	}

	//클래스뷰에서 문의 내용 이전거 있는지 조회하는거
	public ArrayList<Dm> selectOneDmList(int dmRoomNo) {
		// TODO Auto-generated method stub
		List<Dm> list2 = sqlSession.selectList("direct.selectOneDmList", dmRoomNo);
		return (ArrayList<Dm>)list2;
	}

	//클래스 뷰에서 바로 문의 (12-23)
	public ArrayList<Dm> selectOneDmAjaxList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Dm> list4 = sqlSession.selectList("direct.selectOneDmAjaxList", map);
		return (ArrayList<Dm>)list4;
	}
	
	//문의 최초 작성 할때 채팅방 번호 발급 (12-23)
	public int selectOneDmRoomNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("direct.selectOneDmRoomNo", map);
	}
	
	//조회했는데 없으면 시퀀스로 증가 (12-23)
	public int incDmRoomNo() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("direct.incDmRoomNo");
	}

	//안읽은 메세지수 (12-26)
	public int selectDmCnt(HashMap<String, Object> map1) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("direct.selectDmCnt", map1);
	}


}
