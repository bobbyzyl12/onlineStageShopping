package com.ssss.dao;

import java.util.List;

import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserDao {
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ��д�����ݿ��¼
     *
     * @param record
     */
	void add(User user);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ��д�����ݿ��¼
     *
     * @param record
     */
	 void update(User user);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * �������������·������������ݿ��¼
     *
     * @param record
     */
	void updatePwd(String userPwd);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * �������������·������������ݿ�user���е�userName
     *
     * @param record
     */
	void updateName(String userName);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * �������������·������������ݿ�user���е�userPhone
     *
     * @param record
     */
	void updatePhone(String userPhone);
	
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * �������������·������������ݿ�user���е�userPhone
     *
     * @param record
     */
	void updateState(Integer userState);
	
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ��������ɾ�����ݿ�ļ�¼
     *
     * @param id
     */
	void delete(Integer userID);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ��������ȡһ�����ݿ��¼
     *
     * @param id
     */
	User findByID(Integer userID);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,user
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	User findByUserName(String userName);
	
	 /**
     * �˷�����Ӧ�����ݿ��еı� user
     * ��ȡ�����û����������Ե���Ϣ
     *
     * @param id
     */
	List<User> findAll(PageModel<User> t);
	
	Integer findAllCount(PageModel<User> pageModel);

	List<User> findAllNeedCheck();
}
