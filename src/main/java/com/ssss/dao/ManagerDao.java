package com.ssss.dao;

import com.ssss.entity.Manager;

public interface ManagerDao {
	/**
     * 此方法对应于数据库中的表 ,administer
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	Manager findByName(String managerName);
}
