package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import com.spboot.test.entity.ReservationInfo;

public interface ReservationInfoRepository extends JpaRepository<ReservationInfo, Integer> {

	List<ReservationInfo> findAllByOrderByResNumDesc();

	@EntityGraph(attributePaths = {"pcInfo","userInfo"})
	List<ReservationInfo> findByUserInfoUserNumOrderByResNumDesc(Integer resNum);

}
