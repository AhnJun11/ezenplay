package com.spboot.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcCurrentStatus;

public interface PcCurrentStatusService {

	//List<PcCurrentStatus> getPcStatusList();
	PcCurrentStatus getPcCurrentStatus(int pcStatusNum);
	PcCurrentStatus insertPcCurrentStatus(PcCurrentStatus pcStatus);
	PcCurrentStatus updatePcCurrentStatus(PcCurrentStatus pcStatus);
	int deletePcCurrentStatus(int pcStatusNum);
	List<PcCurrentStatus> getPcInfos();
	PcCurrentStatus findOneByPcNum(Integer pcNum);
	int powerOff(int userNum);
	Integer getUser(Integer userNum);
	Integer startPC(Integer userNum);
}
