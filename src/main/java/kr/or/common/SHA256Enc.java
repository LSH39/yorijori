package kr.or.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Enc {
	public String encData(String data) throws Exception{
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(data.getBytes());
		byte[] msgStr = mDigest.digest();
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<msgStr.length; i++) {
			byte tmp = msgStr[i];
			String tmpText = Integer.toString((tmp & 0xff)+0x100,16).substring(1);
			sb.append(tmpText);
		}
		return sb.toString();
	}
}
