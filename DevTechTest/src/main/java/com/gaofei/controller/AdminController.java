package com.gaofei.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gaofei.entity.Admin;
import com.gaofei.service.IAdminService;
import com.gaofei.service.ITokenService;


@RestController
@RequestMapping(value = "/rest/v1/admin")
public class AdminController {
	private static final Logger log =  LogManager.getLogger(AdminController.class);
	@Resource
	private IAdminService adminService;
	@Autowired
    ITokenService tokenService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Object checkLogin(@RequestBody String data) {
		JSONObject jsonObj = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		Admin ad;
		try {
			ad = mapper.readValue(data, Admin.class);
			if (adminService.findByAdminIdAndPwd(ad.getAdminId(), ad.getPwd()) != null) {
				String token = tokenService.getToken(ad);
				jsonObj.put("token", token);
				jsonObj.put("admin", ad);
				return jsonObj;
			} 
			return null;
		} catch (JsonParseException e) {
			log.error(e.toString());
			return null;
		} catch (JsonMappingException e) {
			log.error(e.toString());
			return null;
		} catch (IOException e) {
			log.error(e.toString());
			return null;
		}
	}
}
