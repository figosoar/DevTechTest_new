package com.gaofei.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="DTT_USERINFO")
@JsonIgnoreProperties(value = { "deleted" })
public class UserInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1870989849622939770L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(name="USERID", length=63, nullable=true)
	private String userId;
	@Column(name="USERNAME", length=63, nullable=true)
	private String userName;
	@Column(name="EMAIL", length=63, nullable=true)
	private String email;
	@Column(name="TELEPHONE", length=31, nullable=true)
	private String telephone;
	@Column(name="VISITTIME", length=31, nullable=true)
	private String visitTime;
	@Column(name="REGTIME", length=31, nullable=true)
	private String regTime;
	@Column(name="STATUS", nullable=false)
	private int status;
	@Column(name="DELETED", nullable=true)
	private int deleted;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getVisitTime() {
		return visitTime;
	}

	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	@Override
	public String toString() {
		return "USERINFO [id=" + id 
				+ ", userId=" + userId 
				+ ", userName=" + userName 
				+ ", email=" + email 
				+ ", telephone=" + telephone 
				+ ", visitTime=" + visitTime 
				+ ", regTime=" + regTime 
				+ ", status=" + status 
				+ ", deleted=" + deleted 
				+ "]";
	}
}
