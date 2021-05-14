package com.spboot.test.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcCurrentStatus;
import com.spboot.test.repository.PcCurrentStatusRepository;
import com.spboot.test.service.PcCurrentStatusService;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class PcCurrentStatusServiceImpl implements PcCurrentStatusService {

	@Autowired
	private PcCurrentStatusRepository pcRepo;
	
//	@Override
//	public List<PcCurrentStatus> getPcStatusList() {
//		return pcRepo.findAllByOrderByPcStatusNumDesc();
//	}

	@Override
	public PcCurrentStatus getPcCurrentStatus(int pcStatusNum) {
		Optional<PcCurrentStatus> opPc = pcRepo.findById(pcStatusNum);
		if(opPc.isEmpty()) return null;
		return opPc.get();
	}
	@Override
	public PcCurrentStatus findOneByPcNum(Integer pcNum){
		return pcRepo.findByPcInfoPcSeatNum(pcNum);
	}
	@Override
	public PcCurrentStatus insertPcCurrentStatus(PcCurrentStatus pcStatus) {
		return pcRepo.save(pcStatus);
	}
	@Override
	public List<PcCurrentStatus> getPcInfos(){
		List<PcCurrentStatus> listStatus = pcRepo.findAllByOrderByPcStatusNumDesc();     //예약시간지나면 pcCurrentResult 1로바꿈(사용중)
		for(PcCurrentStatus pc : listStatus) {
			if(pc.getReservationInfo()!=null&&pc.getUserInfo()!=null) {
			log.info("dd=>{}",pc.getReservationInfo());
			Date d = pc.getReservationInfo().getResDate();
			Date t = pc.getReservationInfo().getResTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String date = sdf.format(d);
			sdf = new SimpleDateFormat("HH:mm:ss");
			String time = sdf.format(t);
			String dt = date +" "+ time;
			Date now = new Date();
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sNow = sdf.format(now);
			if(sNow.compareTo(dt)>=0) {
				pc.setPcSeatResult(1);
				pcRepo.save(pc);
			}
		}
	}
	return listStatus;
}
//	@Override
//	public List<PcCurrentStatus> getPcInfos(){
//		return pcRepo.findPcInfoOrderByPcStatusNumDesc();
//	}
	@Override
	public PcCurrentStatus updatePcCurrentStatus(PcCurrentStatus pcStatus) {
		return pcRepo.save(pcStatus);
	}

	@Override
	public int deletePcCurrentStatus(int pcStatusNum) {
		pcRepo.deleteById(pcStatusNum);
		return 0;
	}
	@Override
	public int powerOff(int userNum) {
		PcCurrentStatus pc = pcRepo.findByUserInfoUserNum(userNum);
		if(pc.getPcSeatResult()==1&&pc!=null) { //유저가있고 사용중일때
			pc.setPcSeatResult(0);
			pc.setReservationInfo(null);
			pc.setUserInfo(null);
			pcRepo.save(pc);
			return 1;
		}
		return 0;
	}
	@Override
	public Integer getUser(Integer userNum) {
		if(pcRepo.findByUserInfoUserNum(userNum)!=null){
			PcCurrentStatus pc = pcRepo.findByUserInfoUserNum(userNum);
			if(pc.getPcSeatResult()==1) {
				return 1;
			}else if(pc.getPcSeatResult()==2) {
				return 2;
			}
		}
		return 0;
	}
	@Override
	public Integer startPC(Integer userNum) {
		PcCurrentStatus pc = pcRepo.findByUserInfoUserNum(userNum);
		if(pc.getPcSeatResult()==2) {
			pc.setPcSeatResult(1);
			pcRepo.save(pc);
			return 1;
		}
		return 0;
	}
	


}
