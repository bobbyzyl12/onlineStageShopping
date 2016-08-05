package com.ssss.dao;

import com.ssss.entity.Goods;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

import java.util.List;

public interface GoodsDao {
	/**
     * �˷�����Ӧ�����ݿ��еı� ,goods
     * ��д�����ݿ��¼
     *
     * @param record
     */
	void add(Goods goods);
	
	void update(Goods goods);
	/**
     * �˷�������ģ���������ݿ��еı����Ʒ������contentƥ���Ԫ��
     */
	
	Goods findByID(Integer goodsID);
	
	List<Goods> search(String temp);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� goods
     * ��ȡ�����û����������Ե���Ϣ
     *
     * @param id
     */
	List<Goods> findAll(PageModel<Goods> t);
	
	Integer findAllCount();
	
	void delete(Integer goodsID);
}
