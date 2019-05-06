package com.gaofei.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gaofei.entity.UserInfo;
import com.gaofei.repository.UserInfoRepo;
import com.gaofei.service.IUserInfoService;

@Service
public class UserInfoServiceImpl implements IUserInfoService{
	@Autowired
	private UserInfoRepo userInfoRepo;
	
	@Override
	public UserInfo findById(int id) {
		return userInfoRepo.findById(id);
	}
	
	@Override
	public UserInfo findByUserId(String userId) {
		return userInfoRepo.findByUserId(userId);
	}
	
	@Override
	public List<UserInfo> getAll() {
		return userInfoRepo.findAll();
	}
	
	@Override
	public UserInfo save(UserInfo ui) {
		return userInfoRepo.saveAndFlush(ui);
	}
	
	@Override
	@Transactional
	public int updateStatus(String userId, int id, int status) {
		return userInfoRepo.modifyByUserIdAndId(userId, id, status);
	}
	
	/*
	@Override
	public List<UserInfo> orderBy(String order) {
		if ("asc".equals(order)) {
			return userInfoRepo.findByOrderByIdAsc();
			
		} else {
			return userInfoRepo.findByOrderByIdDesc();
		}
	}
	*/
	
	@Override
	@Transactional
	public List<UserInfo> getAllOrderbyIdDesc() {
		return userInfoRepo.findAllOrderByIdDesc();
	}
	
	@Override
	@Transactional
	public List<UserInfo> getAllOrderbyIdAsc() {
		return userInfoRepo.findAllOrderByIdAsc();
	}
	
	//Filter the customer
	@Override
	public List<UserInfo> findByUserIdLike(String userId) {
		return userInfoRepo.findByUserIdLike(userId);
	}
}
