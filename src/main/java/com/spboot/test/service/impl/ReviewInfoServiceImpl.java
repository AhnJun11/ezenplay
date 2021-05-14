package com.spboot.test.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spboot.test.entity.ReviewInfo;
import com.spboot.test.repository.ReviewInfoRepository;
import com.spboot.test.service.ReviewInfoService;

@Service
public class ReviewInfoServiceImpl implements ReviewInfoService {

	@Autowired
	private ReviewInfoRepository revRepo;
	
	@Override
	public List<ReviewInfo> getReviewList() {
		return revRepo.findAllByOrderByRevNumDesc();
	}

	@Override
	public ReviewInfo getReviewInfo(int revNum) {
		Optional<ReviewInfo> opRe = revRepo.findById(revNum);
		if(opRe.isEmpty()) return null;
		return opRe.get();
	}

	@Override
	public ReviewInfo insertReviewInfo(ReviewInfo review) {
		return revRepo.save(review);
	}

	@Override
	public ReviewInfo updateReviewInfo(ReviewInfo review) {
		ReviewInfo rinfo = revRepo.findByRevNum(review.getRevNum());
		rinfo.setRevStar(review.getRevStar());
		rinfo.setRevComment(review.getRevComment());
		return revRepo.save(rinfo);
	}

	@Override
	public int deleteReviewInfo(int revNum) {
		revRepo.deleteById(revNum);
		if(getReviewInfo(revNum)==null) {
			return 1;
		}
		return 0;
	}

}
