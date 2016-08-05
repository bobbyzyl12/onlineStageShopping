package com.ssss.entity;

public class MyCart {
	private String goodsPicture;
	private String goodsName;
	private Integer quantity;
	private Integer	stageNum;
	private float perPrice;
	private float totalPrice;
	private Integer goodsID;
	private Integer stageLevel;
	
	public String getGoodsPicture() {
		return goodsPicture;
	}
	public void setGoodsPicture(String goodsPicture) {
		this.goodsPicture = goodsPicture;
	}
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Integer getStageNum() {
		return stageNum;
	}
	public void setStageNum(Integer stageNum) {
		this.stageNum = stageNum;
	}
	
	public float getPerPrice() {
		return perPrice;
	}
	public void setPerPrice(float perPrice) {
		this.perPrice = perPrice;
	}
	
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(Integer goodsID) {
		this.goodsID = goodsID;
	}
	public Integer getStageLevel() {
		return stageLevel;
	}
	public void setStageLevel(Integer stageLevel) {
		this.stageLevel = stageLevel;
	}
	
}
