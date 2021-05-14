package com.spboot.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.PayHistoryInfo;
import com.spboot.test.repository.PayHistoryInfoRepository;
import com.spboot.test.service.PayHistoryInfoService;

@Service
public class PayHistoryInfoServiceImpl implements PayHistoryInfoService {

	@Autowired
	private PayHistoryInfoRepository pRepo;
	
	@Override
	public List<PayHistoryInfo> getHistory(int userNum) {
		return pRepo.findByUserInfoUserNum(userNum);
	}

	@Override
	public Integer saveHistory(PayHistoryInfo pi) {
		PayHistoryInfo ph = pRepo.save(pi);
		return ph.getPhNum();
	}
}
