package kr.or.common;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
    
    @Autowired
    protected JavaMailSender mailSender;
    public void SendEmail(String subject, String content, String receiver) throws Exception{
        
        MimeMessage msg = mailSender.createMimeMessage();
        try{
            
            msg.setSubject(subject);
            msg.setText(content);
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(receiver));
            
        }catch(MessagingException e){
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
            mailSender.send(msg);
        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
        
    }
 
}