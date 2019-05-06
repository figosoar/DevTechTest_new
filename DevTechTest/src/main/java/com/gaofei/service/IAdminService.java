package com.gaofei.service;

import com.gaofei.entity.Admin;

public interface IAdminService {
	public Admin findByAdminIdAndPwd(String adminId, String pwd);
	public Admin findByAdminId(String adminId);
}
