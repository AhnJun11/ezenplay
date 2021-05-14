package com.spboot.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spboot.test.entity.PayHistoryInfo;
import com.spboot.test.entity.UserInfo;
import com.spboot.test.service.PayHistoryInfoService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class PayHistoryInfoController {

	@Autowired
	private PayHistoryInfoService payService;
//	
//	@PostMapping("/pay/insert")
//	public Integer insertPay(@RequestBody PayHistoryInfo payInfo) {
//		payService.save(payInfo);        //서비스안만듬
//		return payInfo.getPhNum();
//	}
	@GetMapping("/pay/user")
	public List<PayHistoryInfo> getPay(int userNum) {
		return payService.getHistory(userNum);
	}
	@PostMapping("/testHis")
	public Integer testHis(@ModelAttribute PayHistoryInfo pi){
		log.info("pi=>{}",pi);
		return payService.saveHistory(pi);
	}
}
