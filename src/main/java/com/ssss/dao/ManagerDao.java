package com.ssss.dao;

import com.ssss.entity.Manager;

public interface ManagerDao {
	/**
     * �˷�����Ӧ�����ݿ��еı� ,administer
     * ����ָ���û�����ȡһ�����ݿ��¼
     *
     * @param id
     */
	Manager findByName(String managerName);
}
