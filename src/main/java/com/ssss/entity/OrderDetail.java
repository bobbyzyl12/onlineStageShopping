package com.ssss.entity;

import java.util.Date;

public class OrderDetail {
	private Integer orderDetailID;
	private char stageState;
	private float stageMoney;
	private Date deadline;
	private Integer stageNo;
	private Integer orderID;
	
	public OrderDetail(){}

	public char getStageState() {
		return stageState;
	}

	public void setStageState(char stageState) {
		this.stageState = stageState;
	}

	public float getStageMoney() {
		return stageMoney;
	}

	public void setStageMoney(float stageMoney) {
		this.stageMoney = stageMoney;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Integer getStageNo() {
		return stageNo;
	}

	public void setStageNo(Integer stageNo) {
		this.stageNo = stageNo;
	}


	public Integer getOrderDetailID() {
		return orderDetailID;
	}

	public void setOrderDetailID(Integer orderDetailID) {
		this.orderDetailID = orderDetailID;
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	
	
}
