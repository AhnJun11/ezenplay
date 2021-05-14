package com.spboot.test.service;

import java.util.List;

import com.spboot.test.entity.PayHistoryInfo;

public interface PayHistoryInfoService {

	List<PayHistoryInfo> getHistory(int userNum);
	Integer saveHistory(PayHistoryInfo pi);
}
