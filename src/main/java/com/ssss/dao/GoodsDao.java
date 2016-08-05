package com.ssss.dao;

import com.ssss.entity.Goods;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

import java.util.List;

public interface GoodsDao {
	/**
     * 此方法对应于数据库中的表 ,goods
     * 新写入数据库记录
     *
     * @param record
     */
	void add(Goods goods);
	
	void update(Goods goods);
	/**
     * 此方法用于模糊搜索数据库中的表的商品名中与content匹配的元组
     */
	
	Goods findByID(Integer goodsID);
	
	List<Goods> search(String temp);
	
	/**
     * 此方法对应于数据库中的表 goods
     * 获取所有用户的所有属性的信息
     *
     * @param id
     */
	List<Goods> findAll(PageModel<Goods> t);
	
	Integer findAllCount();
	
	void delete(Integer goodsID);
}
