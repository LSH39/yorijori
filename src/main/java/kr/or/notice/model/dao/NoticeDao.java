package kr.or.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Notice> selectNoticeList(HashMap<String, Object> map) {
		List<Notice> list = sqlSession.selectList("notice.noticeList", map);
		return (ArrayList<Notice>) list;
	}

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("notice.totalCount");
		return totalCount;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = sqlSession.selectOne("notice.selectOneNotice", noticeNo);
		return n;
	}

	public int deleteNotice(int noticeNo) {
		int result = sqlSession.delete("notice.deleteNotice", noticeNo);
		return result;
	}

	public int insertNotice(Notice n) {
		int result = sqlSession.insert("notice.insertNotice", n);
		return result;
	}

	public int readCountUpdate(int noticeNo) {
		int result = sqlSession.update("notice.rcUpdate", noticeNo);
		return result;
	}

	public int selectPrevNo(int noticeNo) {
		int prevNo = sqlSession.selectOne("notice.selectPrevNo", noticeNo);
		return prevNo;
	}

	public int selectNextNo(int noticeNo) {
		int nextNo = sqlSession.selectOne("notice.selectNextNo", noticeNo);
		return nextNo;
	}

	public ArrayList<Notice> searchNoticeList(HashMap<String, Object> map) {
		List<Notice> searchList = sqlSession.selectList("notice.searchList", map);
		return (ArrayList<Notice>) searchList;
	}

	public int selectTotalCount(String searchtype, String searchword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		int totalCount = sqlSession.selectOne("notice.searchCount", map);
		return totalCount;
	}

	public int updateNotice(Notice n) {
		int result = sqlSession.update("notice.updateNotice", n);
		return result;
	}
}
