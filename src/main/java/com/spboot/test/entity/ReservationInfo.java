package com.spboot.test.entity;

import javax.persistence.Transient;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;


@Entity
@Table(name="reservation_info")
@Data
public class ReservationInfo {

	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  @Column(name="res_num",updatable = false)
	  private Integer resNum;
	  @JsonFormat(shape = Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	  @DateTimeFormat(pattern = "yyyy-MM-dd")
	  @Column(name="res_date",insertable=false,updatable = false)
	  private Date resDate;
	  @DateTimeFormat(pattern = "HH:mm:ss")
	  @Column(name="res_time",updatable = false)
	  private Time resTime;
	  @Column(name="res_result")
	  private Integer resResult;
	  
	  @Transient
	  @JsonFormat(shape = Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	  private Date dateNow = new Date();
	  
	  @ManyToOne
	  @JoinColumn(name="user_num")
	  private UserInfo userInfo;
	  
	  @ManyToOne
	  @JoinColumn(name="pc_seat_num")
	  private PcInfo pcInfo;

	  
}
