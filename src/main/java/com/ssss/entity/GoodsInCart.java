package com.ssss.entity;

public class GoodsInCart {
	private Integer cartID;
	private Integer goodsID;
	private Integer quantity;
	private Integer stageLevel;
	
	public GoodsInCart(){
		
	}
	public GoodsInCart(Integer cartID2, Integer goodsID2, Integer quantity2, Integer stageLevel2) {
		// TODO Auto-generated constructor stub
	}
	public Integer getCartID() {
		return cartID;
	}
	public void setCartID(Integer cartID) {
		this.cartID = cartID;
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
	public Integer getStageLevel() {
		return stageLevel;
	}
	public void setStageLevel(Integer stageLevel) {
		this.stageLevel = stageLevel;
	}
}
