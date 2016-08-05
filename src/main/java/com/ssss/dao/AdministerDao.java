package com.ssss.dao;

import com.ssss.entity.Administer;

public interface AdministerDao {
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 新写入数据库记录
     *
     * @param record
     */
	void add(Administer administer);
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 根据主键来更新符合条件的数据库记录
     *
     * @param record
     */
	void updatePwd(Administer administer);
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 根据主键来更新符合条件的数据库administer表中的administerName
     *
     * @param record
     */
	void updateName(Administer administer);
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 根据主键来更新符合条件的数据库administer表中的administerName
     *
     * @param record
     */
	void updateState(Administer administer);
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 根据主键删除数据库的记录
     *
     * @param id
     */
	void delete(Administer id);
	
	 /**
     * 此方法对应于数据库中的表 ,administer
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
	Administer findByID(Integer id);
	
	/**
     * 此方法对应于数据库中的表 ,administer
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	Administer findByName(String administerName);
	
}
