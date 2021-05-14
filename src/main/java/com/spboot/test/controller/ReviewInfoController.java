package com.spboot.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spboot.test.entity.ReviewInfo;
import com.spboot.test.service.ReviewInfoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReviewInfoController {

	@Autowired
	private ReviewInfoService reviewService;
	
	@PostMapping("/review/insert")
	public  @ResponseBody Integer insertReview(@RequestBody ReviewInfo reviewInfo) {
		reviewInfo =reviewService.insertReviewInfo(reviewInfo);
		log.info("review=>{}",reviewInfo);
		return reviewInfo.getRevNum();
	}
	@PostMapping("/review/update")
	public @ResponseBody ReviewInfo update(@RequestBody ReviewInfo reviewInfo) {
		log.info("review=>{}",reviewInfo);
		return reviewService.updateReviewInfo(reviewInfo);
	}
	@GetMapping("/review/delete")
	public @ResponseBody int deleteReviewInfo(@RequestParam int revNum) {
		log.info("delete=>{}",revNum);
		return reviewService.deleteReviewInfo(revNum);
	}
	@GetMapping("review/view")
	public @ResponseBody ReviewInfo getReviewInfo(@RequestParam int revNum) {
		return reviewService.getReviewInfo(revNum);
	}
	@GetMapping("/review/list")
	public @ResponseBody List<ReviewInfo> getReviewInfos(){
		return reviewService.getReviewList();
	}
	
	
}
