package com.mm.member.model;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;


@Component
public class MailSendService{
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	private String authPWDNumber; 
	
	/**이메일 인증*/

	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	
			//이메일 보낼 양식! 
	public String joinEmail(String email) {

		makeRandomNumber();
		String setFrom = "wldnssj@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "머뭄 회원가입 인증입니다."; // 이메일 제목 
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNumber);
	
	}
	
	
	
	//임시 비밀번호 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			
		}
	}

	

/**임시비밀번호 발급*/	
	public void makeRandomPWD() {
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

        String str = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
        int idx = 0;
        for (int i = 0; i < 10; i++) {
            idx = (int) (charSet.length * Math.random());
            str += charSet[idx];
        }
		
	
		System.out.println("임시비밀번호  : " + str);
		authPWDNumber = str;
	}
	
	public String pwdChange(String email) {

		makeRandomPWD();
		String setFrom = "wldnssj@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "머뭄 임시 비밀번호 입니다."; // 이메일 제목 
		String content = 
				"홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
                "<br><br>" + 
			    "고객님의 임시 비밀번호는 " + authPWDNumber + "입니다." + 
			    "<br>" + 
			    "기존의 비밀번호는 사용할 수 없으며 해당 비밀번호로 로그인후 변경해 주시기 바랍니다. "; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		
		return authPWDNumber;
	
	}
	


}
