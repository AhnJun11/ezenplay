package com.spboot.test.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name="pay_history_info")
@Data
public class PayHistoryInfo {

	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Column(name="ph_num")
	 private Integer phNum;
	 @Column(name="ph_type",updatable = false)
	 private String phType ;
	 @DateTimeFormat(pattern = "yyyy-MM-dd")
	 @Column(name="ph_date_time",insertable = false,updatable = false)
	 private LocalDateTime phDateTime ;
	 @Column(name="ph_method",updatable = false)
	 private String phMethod ;
	 @Column(name="ph_price",updatable = false)
	 private Integer phPrice ;
	 @Column(name="ph_details",updatable = false)
	 private String phDetails;
	 @Column(name="ph_save",updatable = false)
	 private Integer phSave;
	 
	 @ManyToOne
	 @JoinColumn(name="user_num",updatable = false)
	 private UserInfo userInfo;

}
