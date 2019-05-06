package com.gaofei.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gaofei.entity.UserNote;
import com.gaofei.service.IUserNoteService;

@RestController
@RequestMapping(value = "/rest/v1/user/note")
public class UserNoteController {
	private static final Logger log =  LogManager.getLogger(UserNoteController.class);
	@Resource
	private IUserNoteService userNoteService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<UserNote> getNoteBySysId(@RequestParam int sysId) {
		return userNoteService.findBySysId(sysId);
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(@RequestParam String notelist, @RequestParam int userId, @RequestParam int adminId) {
		userNoteService.save(notelist, userId, adminId);
	}
}
