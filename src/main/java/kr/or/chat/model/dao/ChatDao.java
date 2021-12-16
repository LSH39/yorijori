package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Chat> chatUserList(int sessionMemberNo) {
		List list = sqlSession.selectList("chat.chatUserList",sessionMemberNo);
		return (ArrayList<Chat>)list;
	}

	public int sendChat(Chat chatSend) {
		return sqlSession.insert("chat.sendChat",chatSend);
	}

	public ArrayList<Chat> chatAdminHomeList(int sessionMemberNo) {
		List list = sqlSession.selectList("chat.chatAdminHomeList",sessionMemberNo);
		return (ArrayList<Chat>)list;
	}

	public ArrayList<Chat> chatAdminList(Chat chat) {
		List list = sqlSession.selectList("chat.chatAdminList",chat);
		return (ArrayList<Chat>)list;
	}
	
	
}
