package com.spboot.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spboot.test.entity.PcInfo;
import com.spboot.test.service.PcInfoService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class PcInfoController {

	@Autowired
	private PcInfoService pService;
	
	
	@PostMapping("/pc/insert")
	public  @ResponseBody Integer insertPc(@RequestBody PcInfo pcinfo) {
		PcInfo pi =pService.insertPcInfo(pcinfo);
		log.info("review=>{}",pi);
		return pi.getPcSeatNum();
	}
	@PostMapping("/pc/update")
	public @ResponseBody PcInfo updatePc(@RequestBody PcInfo pcinfo) {
		log.info("review=>{}",pcinfo);
		return pService.updatePcInfo(pcinfo);
	}
	@GetMapping("/pc/delete")
	public @ResponseBody int deletePcInfo(@RequestParam int pcNum) {
		log.info("delete=>{}",pcNum);
		return pService.deletePcInfo(pcNum);
	}
	@GetMapping("pc/view")
	public @ResponseBody PcInfo getPcInfo(@RequestParam int pcNum) {
		return pService.getPcInfo(pcNum);
	}
	@GetMapping("/pc/list")
	public @ResponseBody List<PcInfo> getPcInfos(){
		return pService.getPcInfoList();
	}
}
