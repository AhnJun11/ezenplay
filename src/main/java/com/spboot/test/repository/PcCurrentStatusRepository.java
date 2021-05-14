package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spboot.test.entity.PcCurrentStatus;

public interface PcCurrentStatusRepository extends JpaRepository<PcCurrentStatus, Integer> {
	@EntityGraph(attributePaths = {"pcInfo","userInfo","reservationInfo"})
	List<PcCurrentStatus> findAllByOrderByPcStatusNumDesc();

	PcCurrentStatus findByPcInfoPcSeatNum(Integer pcSeatNum);
	PcCurrentStatus findByUserInfoUserNum(Integer userNum);
	//PcCurrentStatus findAllByPcPcSeatNumOrderByPcStatusNumDesc(Integer pcSeatNum);
	//PcCurrentStatus findAllByUserUserNumOrderByPcStatusNumDesc(Integer userNum);
}
