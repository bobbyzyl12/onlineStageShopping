package com.ssss.service;

import java.util.List;

import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface UserService{
	
	public String add(User user);
	
	public String signin(User user);
	
	public String update(User user);
	
	public void delete(Integer id);
	
	public User findByID(Integer id);
	
	public void levelUp(Integer userID);
	
	public void rejectLevelUp(Integer userID);
	
	public User findByUserName(String userName);
	
	public List<User> findAll(PageModel<User> pageModel);
	
	public Integer findAllCount(PageModel<User> pageModel);
	
	public List<User> findAllNeedCheck();
		
	public User checkLogin(String userName, String userPwd);
}
