package com.ssss.dao;

import com.ssss.entity.Administer;

public interface AdministerDao {
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * ��д�����ݿ��¼
     *
     * @param record
     */
	void add(Administer administer);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * �������������·������������ݿ��¼
     *
     * @param record
     */
	void updatePwd(Administer administer);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * �������������·������������ݿ�administer���е�administerName
     *
     * @param record
     */
	void updateName(Administer administer);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * �������������·������������ݿ�administer���е�administerName
     *
     * @param record
     */
	void updateState(Administer administer);
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * ��������ɾ�����ݿ�ļ�¼
     *
     * @param id
     */
	void delete(Administer id);
	
	 /**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * ����ָ��������ȡһ�����ݿ��¼
     *
     * @param id
     */
	Administer findByID(Integer id);
	
	/**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	Administer findByName(String administerName);
	
}
