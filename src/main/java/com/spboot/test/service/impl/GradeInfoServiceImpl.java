package com.spboot.test.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.GradeInfo;
import com.spboot.test.repository.GradeInfoRepository;
import com.spboot.test.service.GradeInfoService;

@Service
public class GradeInfoServiceImpl implements GradeInfoService {

	@Autowired
	private GradeInfoRepository gRepo;
	@Override
	public List<GradeInfo> getGradeList() {
		return gRepo.findAllByOrderByGradeNum();
	}

}
