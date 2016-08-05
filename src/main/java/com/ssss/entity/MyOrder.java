package com.ssss.entity;

import java.util.Date;

public class MyOrder {
	private Integer orderID;
	private float orderTotalPrice;
	private String orderState;
	private Integer nextNo;
	private float nextStagePrice;
	private Date deadline;
	private Integer totalStageNum;
	
	public MyOrder(){}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public float getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(float orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	

	public Integer getNextNo() {
		return nextNo;
	}

	public void setNextNo(Integer nextNo) {
		this.nextNo = nextNo;
	}

	public float getNextStagePrice() {
		return nextStagePrice;
	}

	public void setNextStagePrice(float nextStagePrice) {
		this.nextStagePrice = nextStagePrice;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public Integer getTotalStageNum() {
		return totalStageNum;
	}

	public void setTotalStageNum(Integer totalStageNum) {
		this.totalStageNum = totalStageNum;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

}
