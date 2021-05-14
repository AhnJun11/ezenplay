package com.spboot.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcInfo;

public interface PcInfoService {

	List<PcInfo> getPcInfoList();
	PcInfo getPcInfo(int pcSeatNum);
	PcInfo insertPcInfo(PcInfo pc);
	PcInfo updatePcInfo(PcInfo pc);
	int deletePcInfo(int pcSeatNum);
}
