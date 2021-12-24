package kr.or.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.chat.model.vo.Chat;
import kr.or.chat.model.vo.ChatBot;

@Repository
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Chat> chatUserList(int sessionMemberNo) {
		List list = sqlSession.selectList("chat.chatUserList",sessionMemberNo);
		return (ArrayList<Chat>)list;
	}

	public ArrayList<Chat> chatAdminHomeList(int sessionMemberNo) {
		List list = sqlSession.selectList("chat.chatAdminHomeList",sessionMemberNo);
		return (ArrayList<Chat>)list;
	}

	public ArrayList<Chat> chatAdminList(Chat chat) {
		List list = sqlSession.selectList("chat.chatAdminList",chat);
		return (ArrayList<Chat>)list;
	}

	public int chatSend(Chat chatSend) {
		return sqlSession.insert("chat.chatSend",chatSend);
	}
	
	public Chat oneSelect(int chatNo) {
		return sqlSession.selectOne("chat.oneSelect",chatNo);
	}

	public Chat onePrevSelect(int chatSend) {
		return sqlSession.selectOne("chat.onePrevSelect",chatSend);
	}

	public ArrayList<ChatBot> chatbotSelect() {
		List list = sqlSession.selectList("chat.chatbotSelect");
		return (ArrayList<ChatBot>)list;
	}

	public ChatBot chatbotOneSelect(String chatKeyword) {
		return sqlSession.selectOne("chat.chatbotOneSelect",chatKeyword);
	}

	public ArrayList<String> keywordList() {
		List list = sqlSession.selectList("chat.keywordList");
		return (ArrayList<String>)list;
	}

	public int selectMemberNo(String selectUser) {
		return sqlSession.selectOne("member.searchMemberNo",selectUser);
	}

	public String selectMemberNickname(int receiveNo) {
		return sqlSession.selectOne("member.searchMemberNickname", receiveNo);
	}
	
	public int adminMemberNo(String adminId) {
		return sqlSession.selectOne("chat.adminMemberNo", adminId);
	}
	
}
