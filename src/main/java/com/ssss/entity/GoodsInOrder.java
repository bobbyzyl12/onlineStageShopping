package com.ssss.entity;

public class GoodsInOrder {
	private Integer goodsID;
	private Integer orderID;
	private Integer quantity;
	
	public GoodsInOrder(){
	}
	
	public Integer getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}


	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	
	
	
}
