package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.common.EmailSender;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
    private EmailSender emailSender;
	
	// login
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model) {
		
		//Member m = service.loginMember(member); // 임시 로그인
		Member m = service.loginMemberEnc(member);  // 로그인
		
		if(m != null) {
			session.setAttribute("m", m);
			return "redirect:/";
		}else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("loc","/loginFrm.do");
		}
		return "common/msg";
	}
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	// join
	@RequestMapping(value="/joinCommon.do")
	public String joinCommon() {
		return "member/joinCommon";
	}
	@RequestMapping(value="/joinBasicFrm.do")
	public String joinBasicFrm() {
		return "member/joinBasicFrm";
	}
	@RequestMapping(value="/joinProFrm.do")
	public String joinProFrm() {
		return "member/joinProFrm";
	}
	@RequestMapping(value="/joinAdminFrm.do")
	public String joinAdminFrm() {
		return "member/joinAdminFrm";
	}
	// join check
	@ResponseBody
	@RequestMapping(value="/joinSearch.do")
	public String joinSearch(Member member) {
		String memberNo = service.joinSearch(member);
		if(memberNo!=null) {
			return "1";
		}else {
			return "0";
		}
	}
	// mail check
	@ResponseBody
	@RequestMapping("/mailSend.do")
    public String sendEmailAction(String subject, String receiver) throws Exception{
		Random r = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0;i<6;i++) {
			int flag = r.nextInt(3);
			if(flag==0) {
				int randomNum = r.nextInt(10);
				sb.append(randomNum);
			}else if(flag==1) {
				char randomChar = (char)(r.nextInt(26)+65);
				sb.append(randomChar);
			}else if(flag==2) {
				char randomChar = (char)(r.nextInt(26)+97);
				sb.append(randomChar);
			}
		}
        String content = "요리조리 인증번호 : "+sb.toString();
		emailSender.SendEmail(subject, content, receiver);
		return sb.toString();
    }
	// join insert
	@ResponseBody
	@RequestMapping(value="/joinAdmin.do")
	public String joinAdmin(Member member, String domain) {
		int result = service.joinAdminEnc(member, domain);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/joinBasic.do")
	public String joinBasic(Member member, String domain, String consentCheck) {
		if(consentCheck != null) {
			member.setMemberConsent(1);
		}else {
			member.setMemberConsent(0);
		}
		int result = service.joinBasicEnc(member, domain);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@RequestMapping(value="/joinPro.do")
	public String joinPro(Member member, String domain, String consentCheck, MultipartFile file, HttpServletRequest request) {  // MultipartFile의 변수명과 <input name="변수명"> 같게 설정
		if(!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member_certificate/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
			int count=0;
			while(true) {  // 중복파일 검사
				if(count == 0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			member.setCertificatePath(filepath);
		}
		if(consentCheck != null) {
			member.setMemberConsent(1);
		}else {
			member.setMemberConsent(0);
		}
		int result = service.joinProEnc(member, domain);
		if(result>0) {
			return "1";
		}else {
			return "0";
		}
	}
	// findIdPw
	@RequestMapping(value="/findIdFrm.do")
	public String findIdFrm() {
		return "member/findIdFrm";
	}
	@RequestMapping(value="/findPwFrm.do")
	public String findPwFrm() {
		return "member/findPwFrm";
	}
	@RequestMapping(value="/findId.do")
	public String findId(Member member, Model model) {
		Member m = service.findIdPw(member);
		if(m != null) {
			model.addAttribute("m", m);
			return "member/findIdResult";
		}else {
			model.addAttribute("msg", "입력하신 정보로 가입된 아이디가 없습니다.");
			model.addAttribute("loc","/findIdFrm.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/findPw.do")
	public String findPw(Member member, Model model) {
		Member m = service.findIdPw(member);
		if(m != null) {
			model.addAttribute("m", m);
			return "member/findPwResult";
		}else {
			model.addAttribute("msg", "입력하신 정보로 가입된 아이디가 없습니다.");
			model.addAttribute("loc","/findPwFrm.do");
			return "common/msg";
		}
	}
	@RequestMapping(value="/findPwRe.do")
	public String findPwRe(Member member, Model model) {
		int result = service.findPwReEnc(member);
		if(result > 0) {
			model.addAttribute("msg", "변경이 완료되었습니다.");
			model.addAttribute("loc","loginFrm.do");
		}else {
			model.addAttribute("msg", "변경이 실패하였습니다.");
			model.addAttribute("loc","/findPwFrm.do");
		}
		return "common/msg";
	}
	
}

