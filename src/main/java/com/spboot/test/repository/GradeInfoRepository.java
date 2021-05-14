package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spboot.test.entity.GradeInfo;
import com.spboot.test.entity.PcCurrentStatus;

public interface GradeInfoRepository extends JpaRepository<GradeInfo, Integer> {

	List<GradeInfo> findAllByOrderByGradeNum();
}
