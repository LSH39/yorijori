package kr.or.common;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionConfig implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	//중복로그인 지우기
	public synchronized static String getSessionidCheck(String memberId, HttpSession session){
		String result = "";
		for(String key : sessions.keySet() ){
			if(!key.equals(null) && key.equals(memberId)){
				result = "중복";
				sessions.get(key).invalidate();
				sessions.remove(memberId);
				break;
			}
		}
		sessions.put(memberId, session);
		return result;
	}
	
	public static void deleteSession(HttpSession session) {
		for(String key : sessions.keySet() ){
			if(!key.equals(null) && sessions.get(key) == session){
				sessions.remove(key);
				break;
			}
		}
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}