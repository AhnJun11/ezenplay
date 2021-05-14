package com.spboot.test.service.impl;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcCurrentStatus;
import com.spboot.test.entity.ReservationInfo;
import com.spboot.test.entity.UserInfo;
import com.spboot.test.repository.PcCurrentStatusRepository;
import com.spboot.test.repository.ReservationInfoRepository;
import com.spboot.test.repository.UserInfoRepository;
import com.spboot.test.service.ReservationInfoService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReservationInfoServiceImpl implements ReservationInfoService {

	@Autowired
	private ReservationInfoRepository resRepo;
	
	@Autowired
	private PcCurrentStatusRepository PCRepo;
	
	@Override
	public List<ReservationInfo> getList(ReservationInfo resNum) {
		return resRepo.findAllByOrderByResNumDesc();
	}

	@Override
	public List<ReservationInfo> getUserRes(Integer resNum) {
		return resRepo.findByUserInfoUserNumOrderByResNumDesc(resNum);
	}


	@Override
	public String insert(ReservationInfo res) {
		Calendar cal= Calendar.getInstance();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String resDate = sdf.format(cal.getTime());
			resDate = resDate +" "+res.getResTime();
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			cal.setTime(d);
			cal.add(Calendar.MINUTE, 31);
			String now = sdf.format(cal.getTime());
			String msg= "";
			if(resDate.compareTo(now)>0) {
		PcCurrentStatus pc = PCRepo.findByPcInfoPcSeatNum(res.getPcInfo().getPcSeatNum()); //자리예약되있는지
		PcCurrentStatus pc1 = PCRepo.findByUserInfoUserNum(res.getUserInfo().getUserNum()); //사용자가 예약한적있는지
		if(pc1==null) {
			if(pc.getPcSeatResult()==0&&pc.getReservationInfo()==null) { //한명의회원이 하나의좌석만예약가능
				 res.setResResult(1);
				 ReservationInfo r = resRepo.save(res);
				 pc.setPcSeatResult(2);
				 pc.setReservationInfo(r);
				 pc.setUserInfo(r.getUserInfo());
				 if(r!=null) {
				 PCRepo.save(pc);
				 }
				 msg="예약이 완료되었습니다!";
			 }else {
				 msg="이미 예약된 좌석입니다.";
			 }
		}else {
			msg ="좌석은 하나만 예약 가능합니다."; //사용자가 하나의좌석 이상을 예약했을때
		}
	}else {
		msg="예약가능한 시간이 아닙니다.";
	}	
	return msg;
}

	@Override
	public ReservationInfo update(ReservationInfo resNum) {
		return resRepo.save(resNum);
	}

	@Override
	public Integer delete(int resNum) {
		Optional<ReservationInfo> Ores = resRepo.findById(resNum);
		ReservationInfo res = Ores.get();
		PcCurrentStatus pc = PCRepo.findByPcInfoPcSeatNum(res.getPcInfo().getPcSeatNum());
		if(pc.getPcSeatResult()==2&&PCRepo.findByUserInfoUserNum(res.getUserInfo().getUserNum())!=null) {
			res.setResResult(0);
			ReservationInfo r = resRepo.save(res);
			pc.setPcSeatResult(0);
			pc.setReservationInfo(null);
			pc.setUserInfo(null);
			if(r!=null) {
			PCRepo.save(pc);
			}
			return r.getResNum();
		}
		return null;
	}
}
