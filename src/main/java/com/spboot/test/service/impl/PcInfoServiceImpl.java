package com.spboot.test.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.PcInfo;
import com.spboot.test.repository.PcInfoRepository;
import com.spboot.test.service.PcInfoService;

@Service
public class PcInfoServiceImpl implements PcInfoService {

	@Autowired
	private PcInfoRepository pcRepo;
	
	@Override
	public List<PcInfo> getPcInfoList() {
		return pcRepo.findAllByOrderByPcSeatNumDesc();
	}

	@Override
	public PcInfo insertPcInfo(PcInfo pc) {
		return pcRepo.save(pc);
	}

	@Override
	public PcInfo getPcInfo(int pcSeatNum) {
		Optional<PcInfo> opPI = pcRepo.findById(pcSeatNum);
		if(opPI.isEmpty()) return null;
		return opPI.get();
	}

	@Override
	public PcInfo updatePcInfo(PcInfo pc) {
		return pcRepo.save(pc);
	}

	@Override
	public int deletePcInfo(int pcSeatNum) {
		pcRepo.deleteById(pcSeatNum);
		return 0;
	}

}
