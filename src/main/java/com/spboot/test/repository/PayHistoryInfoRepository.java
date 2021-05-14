package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spboot.test.entity.PayHistoryInfo;

public interface PayHistoryInfoRepository extends JpaRepository<PayHistoryInfo, Integer> {
	List<PayHistoryInfo> findByUserInfoUserNum(int userNum);
}
