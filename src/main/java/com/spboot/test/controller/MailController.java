package com.spboot.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spboot.test.service.MailService;
import com.spboot.test.util.CodeGenerator;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Component
class Emails{
	private String code;
}

@RestController
public class MailController {

	@Autowired
	private MailService mailService;

	@Autowired
	private Emails email;
	
	
	@PostMapping("/mail")
	public Emails sendMail(@RequestBody SimpleMailMessage smm) {
		String code = CodeGenerator.getRandomCode();
		String codetext = "인증번호는"+code+"입니다";
		SimpleMailMessage smm2 = new SimpleMailMessage();
		smm2.setText(codetext); 
		smm2.setTo(smm.getTo());
		smm2.setSubject(smm.getSubject());
		mailService.mailSend(smm2);
		email.setCode(code);
		return email;
	}

}
