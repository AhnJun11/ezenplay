package com.spboot.test.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Entity
@Table(name="food_info")
@Data
public class FoodInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="food_num")	
	private Integer foodNum;
	@Column(name="food_type")	
	private String foodType;
	@Column(name="food_name")	
	private String foodName;
	@Column(name="food_desc")	
	private String foodDesc;
	@Column(name="food_img_name")	
	private String foodImgName;
	@Column(name="food_price")	
	private Integer foodPrice;
	@Column(name="food_cook_time")	
	private String foodCookTime;
	
	@Transient
	private MultipartFile foodFile;
}
