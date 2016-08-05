package com.ssss.entity;

import java.util.Date;

public class Order {
	private Integer orderID;
	private Integer userID;
	private Date orderCreateDate;
	private String orderAddress;
	private String orderState;
	private Integer orderLevel;
	private float totalPrice;
	
	public Order(){}
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	
	public Date getOrderCreateDate() {
		return orderCreateDate;
	}
	public void setOrderCreateDate(Date orderCreateDate) {
		this.orderCreateDate = orderCreateDate;
	}
	
	
	
	
	public Integer getOrderLevel() {
		return orderLevel;
	}
	public void setOrderLevel(Integer orderLevel) {
		this.orderLevel = orderLevel;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	
}
