package com.spboot.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/upload")
@Slf4j
public class UploadController {

	private String path ="C:\\Users\\Administrator\\git\\aws-ezenplay\\src\\main\\webapp\\resources\\";
	
	@PostMapping("/image")
	public Map<String,String> uploadImg(@RequestParam MultipartFile upload){
		log.info("file=>{}",upload);
		String fileName = upload.getOriginalFilename();
		File target = new File(path+fileName);
		try {
			upload.transferTo(target);
			Map<String,String> rMap = new HashMap<>();
			rMap.put("uploaded", "true");
			rMap.put("url", "/resources/"+fileName);
			return rMap;
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
