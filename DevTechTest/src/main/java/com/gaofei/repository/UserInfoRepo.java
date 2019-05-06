package com.gaofei.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.gaofei.entity.UserInfo;

public interface UserInfoRepo extends JpaRepository<UserInfo, Integer>{
	UserInfo findById(int id);
	UserInfo findByUserId(String userId);
	List<UserInfo> findAll();
	//List<UserInfo> findByOrderByIdAsc();
	//List<UserInfo> findByOrderByIdDesc();
	@SuppressWarnings("unchecked")
	UserInfo saveAndFlush(UserInfo ui);
	
	@Modifying
    @Query(value = "update dtt_userinfo u set status = ?3 where u.UserId = ?1 and u.id = ?2", nativeQuery = true)
	int modifyByUserIdAndId(String userId, int id, int status);
	
	//@Query(value = "select * from dtt_userinfo order by id desc", nativeQuery = true)
	@Query(value = "select id,userid,userName,email,telephone,visitTime,regTime,status,deleted from dtt_userinfo order by id desc", nativeQuery = true)
	List<UserInfo> findAllOrderByIdDesc();
	//List<UserInfo> findByOrderByIdDesc();
	
	@Query(value = "select id,userid,userName,email,telephone,visitTime,regTime,status,deleted from dtt_userinfo order by id asc", nativeQuery = true)
	List<UserInfo> findAllOrderByIdAsc();
	
	//@Query(value = "select id,userid,userName,email,telephone,visitTime,regTime,status,deleted from dtt_userinfo order by id asc", nativeQuery = true)
	List<UserInfo> findByUserIdLike(String userId);
}
