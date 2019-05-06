package com.gaofei.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="DTT_USERNOTE")
@JsonIgnoreProperties(value = { "adminId", "deleted" })
public class UserNote implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -824533488414320658L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="USERID", nullable=false)
	private int userId;
	@Column(name="NOTE", length=255, nullable=false)
	private String note;
	@Column(name="CREATETIME", length=31, nullable=false)
	@CreatedDate
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private String createTime;
	@Column(name="ADMINID", nullable=false)
	private int adminId;
	@Column(name="DELETED", nullable=true)
	private int deleted;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getNote() {
		return note;
	}
	
	public void setNote(String note) {
		this.note = note;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	public int getAdminId() {
		return adminId;
	}
	
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	
	public int getDeleted() {
		return deleted;
	}
	
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	
	@Override
	public String toString() {
		return "USERNOTE [id=" + id 
				+ ", userId=" + userId 
				+ ", note=" + note 
				+ ", createTime=" + createTime 
				+ ", adminId=" + adminId 
				+ ", deleted=" + deleted 
				+ "]";
	}
}
