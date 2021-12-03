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
}
