package com.gaofei.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gaofei.annotation.LoginToken;
import com.gaofei.entity.UserInfo;
import com.gaofei.service.IUserInfoService;

@RestController
@RequestMapping(value = "/rest/v1/user/info")
public class UserInfoController {
	private static final Logger log =  LogManager.getLogger(UserInfoController.class);
	@Resource
	private IUserInfoService userInfoService;
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	public UserInfo getUserById(@PathVariable int id) {
		return userInfoService.findById(id);
	}
	
	@RequestMapping(value = "/userid/{userId}", method = RequestMethod.GET)
	public UserInfo getUserByUserId(@PathVariable String userId) {
		return userInfoService.findByUserId(userId);
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	//@LoginToken
	public List<UserInfo> getAll() {
		return userInfoService.getAll();
	}	
	
	/*
	@RequestMapping(value = "/orderby/id/{order}", method = RequestMethod.GET)
	public List<UserInfo> orderBy(@PathVariable String order) {
		return userInfoService.orderBy(order);
	}
	*/
	
	@RequestMapping(value = "/list/orderby/id/desc", method = RequestMethod.GET)
	public List<UserInfo> getAllOrderbyIdDesc() {
		return userInfoService.getAllOrderbyIdDesc();
	}
	
	@RequestMapping(value = "/list/orderby/id/asc", method = RequestMethod.GET)
	public List<UserInfo> getAllOrderbyIdAsc() {
		return userInfoService.getAllOrderbyIdAsc();
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	//@LoginToken
	public UserInfo save(@RequestBody String data) {
		ObjectMapper mapper = new ObjectMapper();
		UserInfo ui;
		try {
			ui = mapper.readValue(data, UserInfo.class);
			//ui.setRegTime((new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()));
			//ui.setVisitTime((new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()));
			//ui.setDeleted(0);
			return userInfoService.save(ui);
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
	
	//Save the change of status' change
	@RequestMapping(value = "/status/update/{userId}/{id}/{status}", method = RequestMethod.POST)
	public int UpdateStatus(@PathVariable String userId, @PathVariable int id, @PathVariable int status) {
		return userInfoService.updateStatus(userId, id, status);
	}
	

	//Filter the customer BY userId
	@RequestMapping(value = "/filter", method = RequestMethod.GET)
	public List<UserInfo> findByUserIdLike(@RequestParam String userId) {
		return userInfoService.findByUserIdLike(userId);
	}
	
}
