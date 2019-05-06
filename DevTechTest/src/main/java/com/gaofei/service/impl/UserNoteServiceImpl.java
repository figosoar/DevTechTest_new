package com.gaofei.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gaofei.entity.UserNote;
import com.gaofei.repository.UserNoteRepo;
import com.gaofei.service.IUserNoteService;

@Service
public class UserNoteServiceImpl implements IUserNoteService{
	@Autowired
	private UserNoteRepo userNoteRepo;
	
	@Override
	public List<UserNote> findBySysId(int sysId) {
		return userNoteRepo.findAllByUserId(sysId);
	}
	
	@Override
	public void save(String notelist, int userId, int adminId) {
		String[] note = notelist.split(";");
		String[] txtNote;
		UserNote un = new UserNote();
		
		for(int i=0; i < note.length; i++ ) {
			txtNote = note[i].split(",");
			if(txtNote[0].equals("newNoteInput")) {
				un.setId(0);
			} else {
				un.setId(Integer.parseInt(txtNote[0]));
			}
			un.setNote(txtNote[1]);
			un.setDeleted(0);
			un.setCreateTime((new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()));
			un.setAdminId(adminId);
			un.setUserId(userId);
			userNoteRepo.saveAndFlush(un);
		}
	}
}
