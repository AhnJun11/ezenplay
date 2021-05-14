package com.spboot.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
//github.com/cwyoon75/aws-ezenplay.git
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//github.com/cwyoon75/aws-ezenplay.git
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spboot.test.entity.UserInfo;
import com.spboot.test.service.UserInfoService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserInfoController {

	@Autowired
	private UserInfoService uService;

	@GetMapping("/users")
	public List<UserInfo> getUser() {
		return uService.getList();
	}
	
	@GetMapping("/user")
	public UserInfo getUser(int userNum) {
		return uService.getUser(userNum);
	}

	@PostMapping("/check")
	public boolean checkId(@RequestBody String userId) {
		return uService.checkId(userId);
	}
	@PostMapping("/findId")
	public @ResponseBody UserInfo findId(@RequestBody UserInfo ui) {
		UserInfo userInfo = uService.findId(ui);
		log.info("ui=>{}",userInfo);
		if (userInfo != null) {
			
		}
		return userInfo;
	}
	@PostMapping("/matchemail")
	public @ResponseBody UserInfo match(@RequestBody UserInfo ui) {
		UserInfo userInfo = uService.match(ui);
		log.info("atoservice=>{}",userInfo);
		if (userInfo == null) {
			return null;
		}

			return userInfo;
		
	}

	@PostMapping("/login")
	public @ResponseBody UserInfo login(@RequestBody UserInfo ui, HttpServletRequest req) {
		UserInfo userInfo = uService.login(ui);
		if (userInfo != null && userInfo.getAction().equals("1")) {
			HttpSession session = req.getSession();
			session.setAttribute("UserInfo", userInfo);
			return userInfo;
		}
		return null;
	}

	@PostMapping("/logout")
	public @ResponseBody boolean logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return true;
	}
	@PostMapping("/updatepwd")
	public UserInfo updatepwd(@RequestBody UserInfo ui) {
		
		return uService.saveUserPwd(ui); //페스워드만 바꾸기화면  비밀번호변경하기는 아이디찾기전에는 막아두기
	}

	@PostMapping("/memberjoin")
	public Integer upload(@ModelAttribute UserInfo mf) {
		log.info("mf=>{}", mf);
		return uService.saveUserInfo(mf);
	}

	@DeleteMapping("/withdrawn") //회원탈퇴
	public Integer withdrawn(@ModelAttribute UserInfo userInfo,HttpServletRequest req) {
		int result = uService.withdrawnUserInfo(userInfo);
		 if(result==1) {
			HttpSession s = req.getSession();
			s.invalidate();
		 }
		return result;
	}

	@PostMapping("/update")
	public Integer updateUser(@ModelAttribute UserInfo userInfo,HttpServletRequest req) {
		log.info("userInfo=>{}",userInfo);
		UserInfo ui  = uService.getUser(userInfo.getUserNum());
		HttpSession session = req.getSession();
		if(ui!=null) {
		session.setAttribute("UserInfo", userInfo);
		}
		return uService.updateUserInfo(userInfo);
	}
	@PostMapping("/testPay")
	public UserInfo testPay(@ModelAttribute UserInfo ui){
		log.info("ui=>{}",ui);
		return uService.testPay(ui);
	}
	@PostMapping("/mileage")
	public UserInfo mileage(@ModelAttribute UserInfo userInfo) {
		log.info("mi=>{}",userInfo);
		return uService.mileage(userInfo);
	}
	@PostMapping("loads/")
	public UserInfo loads(@ModelAttribute UserInfo userInfo) {
		log.info("userInfo=>{}",userInfo);
		return uService.uploadAmount(userInfo);
	}
	

}
