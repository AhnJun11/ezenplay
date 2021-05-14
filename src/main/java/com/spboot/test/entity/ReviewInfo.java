package com.spboot.test.entity;

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

import lombok.Data;

@Entity
@Table(name="review_info")
@Data
public class ReviewInfo {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   @Column(name="rev_num")
	   private Integer revNum;
	   @Column(name="rev_comment")
	   private String revComment ;
	   @Column(name="rev_star")
	   private Integer revStar;
	   @DateTimeFormat(pattern = "yyyy-MM-dd")
	   @Column(name="rev_posted_date",insertable = false,updatable = false)
	   private Date revPostedDate;
	   @Column(name="rev_posted_time",insertable = false,updatable = false)
	   private Time revPostedTime;
	  
	   @ManyToOne
	   @JoinColumn(name="user_num")
	   private UserInfo userInfo;
}
