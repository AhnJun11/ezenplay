package com.spboot.test.repository;

import java.util.List;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spboot.test.entity.UserInfo;

public interface UserInfoRepository extends JpaRepository<UserInfo, Integer> {

	public List<UserInfo> findAllByOrderByUserNumDesc();
	public UserInfo findByUserIdAndUserPwd(String userId, String userPwd);
	public UserInfo findByUserNameAndUserDateOfBirthAndUserPhone(String userName, String userDateOfBirth, String userPhone);
	public boolean existsByUserId(String userId);
	public UserInfo findByUserId(String userId);
	public UserInfo findByUserNum(Integer userNum);
	public UserInfo findByUserNameAndUserDateOfBirthAndUserPhoneAndUserEmail(String userName, String userDateOfBirth, String userPhone,String userEmail);
	@Modifying
	@Query(value = "UPDATE user_info  ui\r\n"
			+ "SET total_amount = (SELECT SUM(ph_price) FROM pay_history_info phi WHERE ui.user_num=phi.user_num)" , nativeQuery = true)
	UserInfo updateTotalAmount(UserInfo userInfo);
	@Modifying
	@Query(value = "UPDATE user_info  ui\r\n"
			+ "SET user_mileage = (SELECT SUM(ph_save) FROM pay_history_info phi WHERE ui.user_num=phi.user_num)" , nativeQuery = true)
	UserInfo updateUserMileage(UserInfo userInfo);
}
