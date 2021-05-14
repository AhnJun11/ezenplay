package com.spboot.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spboot.test.entity.ReviewInfo;

public interface ReviewInfoService {

	List<ReviewInfo> getReviewList();
	ReviewInfo getReviewInfo(int revNum);
	ReviewInfo insertReviewInfo(ReviewInfo review);
	ReviewInfo updateReviewInfo(ReviewInfo review);
	int deleteReviewInfo(int revNum);
}
