package com.ssss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.CartDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Cart;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
import com.ssss.service.UserService;

@Service(value = "userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CartDao cartDao;
	
	public String add(User user) {
		User sameuser = userDao.findByUserName(user.getUserName());
		if(sameuser == null){
			userDao.add(user);
			cartDao.addCart(user.getUserID());
			return "success";
		}
		else return "repeat";
	}
	
	public String signin(User user) {
		User sameuser = userDao.findByUserName(user.getUserName());
		if(sameuser == null){
			userDao.add(user);
			cartDao.addCart(user.getUserID());
			return "success";
		}
		else return "repeat";
	}
	
	public String update(User user){
		userDao.update(user);
		return "success";
	}
	
	public void delete(Integer userID) {
		User temp=userDao.findByID(userID);
		temp.setUserState("3");
		userDao.update(temp);
	}
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public User findByID(Integer userID) {
		return userDao.findByID(userID);
	}
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public User findByUserName(String userName) {
		return userDao.findByUserName(userName);
	}
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED,readOnly = true)
	public List<User> findAll(PageModel<User> pageModel) {
		return userDao.findAll(pageModel);
	}
	
	@Transactional
	public Integer findAllCount(PageModel<User> pageModel) {
		return userDao.findAllCount(pageModel);
	}
	
	public User checkLogin(String userName, String userPwd) {
        //根据用户名实例化用户对象
        User user = userDao.findByUserName(userName);
        if (user != null && user.getUserPwd().equals(userPwd)) {
            return user;
        }
        return null;
    }
	
	public List<User> findAllNeedCheck(){
		return userDao.findAllNeedCheck();
	}
	
	public void levelUp(Integer userID){
		User temp = userDao.findByID(userID);
		Integer currentCredit = temp.getUserCredit() + 1;
		temp.setUserCredit(currentCredit);
		temp.setUserState("1");
		userDao.update(temp);
	}
	
	public void rejectLevelUp(Integer userID){
		User temp = userDao.findByID(userID);
		temp.setUserState("1");
		userDao.update(temp);
	}
}