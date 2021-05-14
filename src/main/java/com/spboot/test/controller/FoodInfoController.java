package com.spboot.test.controller;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spboot.test.entity.FoodInfo;
import com.spboot.test.service.FoodInfoService;


@Controller

public class FoodInfoController {

	@Autowired
	private FoodInfoService foodService;
	
	@GetMapping("/food-list")
	public @ResponseBody List<FoodInfo> foodList(){

		return foodService.getFoodInfoList();
	}
	
	@GetMapping("/food-info")
	public @ResponseBody List<FoodInfo> foodInfos(@RequestParam String foodType){
		if(foodType==null) {
			return foodService.getFoodInfoList();
		}
		return foodService.getFoodInfos(foodType);
	}
	
	@PostMapping("/views/food/food-result")
	public  FoodInfo insertFood(@ModelAttribute FoodInfo food) {
		return foodService.insertFoodInfo(food);
	}
	
	@GetMapping("/food-update")
	public @ResponseBody Optional<FoodInfo> getFoodInfo(@RequestParam Integer foodNum) {
		return foodService.getFoodInfo(foodNum);
	
	}
	
	@PostMapping("/food-update")
	public @ResponseBody FoodInfo updateFoodInfo(@ModelAttribute FoodInfo foodInfo) {
		
		return foodService.updateFoodInfo(foodInfo);
	}
	
	@DeleteMapping("/food-delete")
	public @ResponseBody int deleteFoodInfo(@RequestParam Integer foodNum) {
		return foodService.deleteFoodInfo(foodNum);
	}
	
	@GetMapping("/food-search")
	public @ResponseBody List<FoodInfo> searchFoodInfo(@RequestParam String foodName){
		return foodService.searchFoodInfo(foodName);
	}
	
}