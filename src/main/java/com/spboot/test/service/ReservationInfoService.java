package com.spboot.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcCurrentStatus;
import com.spboot.test.entity.ReservationInfo;

public interface ReservationInfoService {
	
	List<ReservationInfo> getList(ReservationInfo resNum);
	List<ReservationInfo> getUserRes(Integer resNum);
	String insert(ReservationInfo resNum);
	ReservationInfo update(ReservationInfo resNum);
	Integer delete(int resNum);
	
}
