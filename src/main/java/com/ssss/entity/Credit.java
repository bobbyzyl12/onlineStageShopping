package com.ssss.entity;

public class Credit {
	private Integer creditID;
	private Integer maxNum;
	private Integer maxPass;
	private float interest;
	public Credit(){}
	
	public Integer getCreditID() {
		return creditID;
	}
	public void setCreditID(Integer creditID) {
		this.creditID = creditID;
	}
	public Integer getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(Integer maxNum) {
		this.maxNum = maxNum;
	}
	public Integer getMaxPass() {
		return maxPass;
	}
	public void setMaxPass(Integer maxPass) {
		this.maxPass = maxPass;
	}
	public float getInterest() {
		return interest;
	}
	public void setInterest(float interest) {
		this.interest = interest;
	}
}
