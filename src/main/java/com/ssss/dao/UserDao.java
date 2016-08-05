package com.ssss.dao;

import java.util.List;

import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserDao {
	 /**
     * 此方法对应于数据库中的表 ,user
     * 新写入数据库记录
     *
     * @param record
     */
	void add(User user);
	
	/**
     * 此方法对应于数据库中的表 ,user
     * 新写入数据库记录
     *
     * @param record
     */
	 void update(User user);
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键来更新符合条件的数据库记录
     *
     * @param record
     */
	void updatePwd(String userPwd);
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键来更新符合条件的数据库user表中的userName
     *
     * @param record
     */
	void updateName(String userName);
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键来更新符合条件的数据库user表中的userPhone
     *
     * @param record
     */
	void updatePhone(String userPhone);
	
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键来更新符合条件的数据库user表中的userPhone
     *
     * @param record
     */
	void updateState(Integer userState);
	
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据主键删除数据库的记录
     *
     * @param id
     */
	void delete(Integer userID);
	 /**
     * 此方法对应于数据库中的表 ,user
     * 根据指定主键获取一条数据库记录
     *
     * @param id
     */
	User findByID(Integer userID);
	
	/**
     * 此方法对应于数据库中的表 ,user
     * 根据指定用户名获取一条数据库记录
     *
     * @param id
     */
	User findByUserName(String userName);
	
	 /**
     * 此方法对应于数据库中的表 user
     * 获取所有用户的所有属性的信息
     *
     * @param id
     */
	List<User> findAll(PageModel<User> t);
	
	Integer findAllCount(PageModel<User> pageModel);

	List<User> findAllNeedCheck();
}
