package com.ssss.entity;

public class Administer {
	private Integer administerID;
	private String administerName;
	private String administerPwd;
	private char administerState;
	
	public Integer getAdministerID() {
		return administerID;
	}
	public void setAdministerID(Integer administerID) {
		this.administerID = administerID;
	}
	
	public String getAdministerName() {
		return administerName;
	}
	public void setAdministerName(String administerName) {
		this.administerName = administerName;
	}
	
	public String getAdministerPwd() {
		return administerPwd;
	}
	public void setAdministerPwd(String administerPwd) {
		this.administerPwd = administerPwd;
	}
	
	public char getAdministerState() {
		return administerState;
	}
	public void setAdministerState(char administerState) {
		this.administerState = administerState;
	}
}
