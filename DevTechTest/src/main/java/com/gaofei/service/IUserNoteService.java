package com.gaofei.service;

import java.util.List;

import com.gaofei.entity.UserNote;

public interface IUserNoteService {
	
	//Query the customers' notes
	public List<UserNote> findBySysId(int sysId);
	
	//Save the notes after add or edit
	public void save(String notelist, int userId, int adminId);
}
