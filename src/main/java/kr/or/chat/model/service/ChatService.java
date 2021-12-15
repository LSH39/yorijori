package kr.or.chat.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.chat.model.dao.ChatDao;
import kr.or.chat.model.vo.Chat;

@Service
public class ChatService {
	@Autowired
	private ChatDao dao;

	public ArrayList<Chat> chatUserList(int sessionMemberNo) {
		ArrayList<Chat> chatList = dao.chatUserList(sessionMemberNo);
		for(int i=0; i<chatList.size(); i++) {
			Date beforeDate = chatList.get(i).getChatDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String newDate = simpleDateFormat.format(beforeDate);
			chatList.get(i).setStrDate(newDate);
		}
		return chatList;
	}

	public int sendChat(Chat chatSend) {
		chatSend.setChatContent(chatSend.getChatContentBr());
		return dao.sendChat(chatSend);
	}

	public ArrayList<Chat> chatAdminHomeList(int sessionMemberNo) {
		ArrayList<Chat> chatList = dao.chatAdminHomeList(sessionMemberNo);
		for(int i=0; i<chatList.size(); i++) {
			Date beforeDate = chatList.get(i).getChatDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String newDate = simpleDateFormat.format(beforeDate);
			chatList.get(i).setStrDate(newDate);
		}
		return chatList;
	}

	public ArrayList<Chat> chatAdminList(Chat chat) {
		ArrayList<Chat> chatList = dao.chatAdminList(chat);
		for(int i=0; i<chatList.size(); i++) {
			Date beforeDate = chatList.get(i).getChatDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String newDate = simpleDateFormat.format(beforeDate);
			chatList.get(i).setStrDate(newDate);
		}
		return chatList;
	}
	
	
}
