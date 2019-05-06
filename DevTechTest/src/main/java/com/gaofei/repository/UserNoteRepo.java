package com.gaofei.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gaofei.entity.UserNote;

public interface UserNoteRepo extends JpaRepository<UserNote, Integer>{
	List<UserNote> findAllByUserId(int userId);
	
	@SuppressWarnings("unchecked")
	UserNote saveAndFlush(UserNote un);
}
