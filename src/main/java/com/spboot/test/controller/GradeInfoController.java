package com.spboot.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spboot.test.entity.GradeInfo;
import com.spboot.test.service.GradeInfoService;

@RestController
public class GradeInfoController {
	@Autowired
	private GradeInfoService gradeService;
	
	@GetMapping("/grades")
	public List<GradeInfo> getGrade(){
		return gradeService.getGradeList();
	}
}
