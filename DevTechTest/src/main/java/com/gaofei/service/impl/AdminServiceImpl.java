package com.gaofei.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaofei.entity.Admin;
import com.gaofei.repository.AdminRepo;
import com.gaofei.service.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService{
	@Autowired
	private AdminRepo adminRepo;
	
	@Override
	public Admin findByAdminIdAndPwd(String adminId, String pwd) {
		return adminRepo.findByAdminIdAndPwd(adminId, pwd);
	}
	
	@Override
	public Admin findByAdminId(String adminId) {
		return adminRepo.findByAdminId(adminId);
	}
}
