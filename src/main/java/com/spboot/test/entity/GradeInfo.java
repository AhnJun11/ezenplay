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
@Table(name="grade_info")
@Data
public class GradeInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="grade_num",unique = true)
	private Integer gradeNum;
	@Column(name="grade_name")
	private String gradeName;
	@Column(name="grade_per")
	private Integer gradePer;
	@Column(name="grade_price")
	private Integer gradePrice;
	@Column(name="file_path")
	private String filePath;

}
