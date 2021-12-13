package kr.or.freeboard.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.freeboard.model.vo.Freeboard;
import kr.or.freeboard.model.vo.FreeboardComment;
import kr.or.freeboard.model.vo.FreeboardFile;

@Repository
public class FreeboardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Freeboard> selectFreeList(HashMap<String, Object> map) {
		List<Freeboard> list = sqlSession.selectList("freeboard.freeList", map);
		return (ArrayList<Freeboard>) list;
	}

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("freeboard.totalCount");
		return totalCount;
	}

	public ArrayList<FreeboardComment> selectCommentList(int freeNo) {
		List<FreeboardComment> commentList = sqlSession.selectList("freeboard.commentList", freeNo);
		return (ArrayList<FreeboardComment>) commentList;
	}

	public ArrayList<FreeboardFile> selectFileList(int freeNo) {
		List<FreeboardFile> fileList = sqlSession.selectList("freeboard.fileList", freeNo);
		return (ArrayList<FreeboardFile>) fileList;
	}

	public Freeboard selectOneFree(int freeNo) {
		Freeboard fb = sqlSession.selectOne("freeboard.selectOneFree", freeNo);
		return fb;
	}
}
