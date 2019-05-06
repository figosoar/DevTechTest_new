package com.gaofei.service;

import java.util.List;

import com.gaofei.entity.UserInfo;

public interface IUserInfoService {
	public UserInfo findById(int id);
	public UserInfo findByUserId(String userId);
	public List<UserInfo> getAll();
	public List<UserInfo> getAllOrderbyIdDesc();
	public List<UserInfo> getAllOrderbyIdAsc();
	//public List<UserInfo> orderBy(String order);
	public UserInfo save(UserInfo ui);
	public int updateStatus(String userId, int id, int status);
	
	//Filter the customer
	public List<UserInfo> findByUserIdLike(String userId);
}
