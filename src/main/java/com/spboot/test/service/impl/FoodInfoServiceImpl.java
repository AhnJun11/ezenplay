package com.spboot.test.service.impl;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spboot.test.entity.FoodInfo;
import com.spboot.test.repository.FoodInfoRepository;
import com.spboot.test.service.FoodInfoService;


@Service
public class FoodInfoServiceImpl implements FoodInfoService {
	
	private final String ROOT = System.getProperty("user.dir")+"\\src\\main\\webapp\\resources\\images\\food\\";
	
	 
	
	@Autowired
	private FoodInfoRepository foodRepo;
	
	@Override
	public List<FoodInfo> getFoodInfoList() {
		return foodRepo.findAllByOrderByFoodNumDesc();
	}

	@Override
	public FoodInfo insertFoodInfo(FoodInfo food) {
		MultipartFile mf = food.getFoodFile();
		if(mf!=null) {
			String foodImgName = mf.getOriginalFilename();
			food.setFoodImgName(foodImgName);
			File file = new File(ROOT+foodImgName);
			try {
				mf.transferTo(file);   
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return foodRepo.save(food);
	}
		


	@Override
	public Optional<FoodInfo> getFoodInfo(int foodNum) {
		return foodRepo.findById(foodNum);
	}

	@Override
	public FoodInfo updateFoodInfo(FoodInfo food) {
		
		
		MultipartFile mf = food.getFoodFile();
		if(mf!=null) {
			String foodImgName = mf.getOriginalFilename();
			food.setFoodImgName(foodImgName);
			File file = new File(ROOT+foodImgName);
			try {
				mf.transferTo(file);   
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		return foodRepo.save(food);
	}

	@Override
	public int deleteFoodInfo(int foodNum) {
		foodRepo.deleteById(foodNum);
		if(getFoodInfo(foodNum)==null) {
			return 1;
		}
		return 0;
	}

	@Override
	public List<FoodInfo> getFoodInfos(String foodType) {
		if(foodType==null) {
			return foodRepo.findAllByOrderByFoodNumDesc();
		}
		
		return foodRepo.findAllByFoodTypeOrderByFoodNumDesc(foodType);
	}

	@Override
	public List<FoodInfo> searchFoodInfo(String foodName) {
		return foodRepo.findAllByFoodNameContainsOrderByFoodNumDesc(foodName);
	}



}
