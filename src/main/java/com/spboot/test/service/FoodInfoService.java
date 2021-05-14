package com.spboot.test.service;

import java.util.List;
import java.util.Optional;

import com.spboot.test.entity.FoodInfo;

public interface FoodInfoService {
	
	List<FoodInfo> getFoodInfoList();
	Optional<FoodInfo> getFoodInfo(int foodNum);
	FoodInfo insertFoodInfo(FoodInfo food);
	FoodInfo updateFoodInfo(FoodInfo food);
	int deleteFoodInfo(int foodNum);
	List<FoodInfo> getFoodInfos(String foodType);
	List<FoodInfo> searchFoodInfo(String foodName);

}
