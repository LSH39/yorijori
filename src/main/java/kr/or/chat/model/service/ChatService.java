package kr.or.chat.model.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	public ArrayList<Chat> chatAdminHomeList(int sessionMemberNo) {
		ArrayList<Chat> chatList = dao.chatAdminHomeList(sessionMemberNo);
		ArrayList<Chat> newChatList = new ArrayList<Chat>();
		int [] memberNo = new int[chatList.size()];
		for(int i=0; i<chatList.size(); i++) {
			int mNo = 0;
			int checkNo = 0;
			if(chatList.get(i).getChatSend() == sessionMemberNo) {  // 보낸사람 = 관리자
				mNo = chatList.get(i).getChatReceive();
				checkNo = 0;
				for(int j=0; j<memberNo.length; j++) {
					if(memberNo[j] == mNo) {
						checkNo = 1;
						break;
					}
				}
				if(checkNo != 1) {
					memberNo[i] = mNo;
					int receiveNo = chatList.get(i).getChatReceive();
					String newNickname = dao.selectMemberNickname(receiveNo);
					chatList.get(i).setMemberNickname(newNickname);  // memberNickname >> 받는사람 nick으로
					newChatList.add(chatList.get(i));
				}
			}else {  // 보낸사람 = 회원/전문가
				mNo = chatList.get(i).getChatSend();
				checkNo = 0;
				for(int j=0; j<memberNo.length; j++) {
					if(memberNo[j] == mNo) {
						checkNo = 1;
						break;
					}
				}
				if(checkNo != 1) {
					memberNo[i] = mNo;
					newChatList.add(chatList.get(i));
				}
			}
		}
		for(int i=0; i<newChatList.size(); i++) {
			Date beforeDate = newChatList.get(i).getChatDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String newDate = simpleDateFormat.format(beforeDate);
			newChatList.get(i).setStrDate(newDate);
		}
		System.out.println("size : "+newChatList.size());
		
		return newChatList;
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
	
	@Transactional
	public int chatSend(Chat chat) {
		return dao.chatSend(chat);
	}
	
	public Chat oneSelect(int chatNo) {
		Chat chat = dao.oneSelect(chatNo);
		Date beforeDate = chat.getChatDate();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
		String newDate = simpleDateFormat.format(beforeDate);
		chat.setStrDate(newDate);
		return chat;
	}

	public Chat onePrevSelect(int chatSend) {
		Chat chat = dao.onePrevSelect(chatSend);
		if(chat != null) {
			Date beforeDate = chat.getChatDate();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String newDate = simpleDateFormat.format(beforeDate);
			chat.setStrDate(newDate);			
		}
		return chat;
	}
	
	
}
