package com.gaofei.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gaofei.entity.Admin;

public interface AdminRepo extends JpaRepository<Admin, Integer>{
	Admin findByAdminIdAndPwd(String adminId, String pwd);
	Admin findByAdminId(String adminId);
}
