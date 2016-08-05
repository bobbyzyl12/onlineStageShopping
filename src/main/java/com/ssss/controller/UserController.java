package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssss.entity.Goods;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier(value="goodsService")
	private GoodsService goodsService;

	/**
     * 添加信息(用户注册)
     * @param user
     * @return
     */
	@RequestMapping(value = "/signin")
	@ResponseBody
	public String signin(User user){
		if(userService.signin(user)=="success"){
			return "success";
		}
		else if(userService.signin(user)=="repeat"){
			return "repeat";
			}
		else return "fail";
	}
	

	/**
     * 用户登陆
     * @param id
     * @return
     */
	@RequestMapping(value="/login")
	@ResponseBody
    public String login(@RequestParam(value = "userName") String userName,@RequestParam(value = "userPwd") String userPwd,HttpSession session) throws Exception {
        User user = userService.checkLogin(userName, userPwd);
        if(user!=null){
        	String state =user.getUserState();
             if(state == "3")
             {
            	 	return "locked";
             }
             else
             {
            	 session.setAttribute("userID", user.getUserID());
            	 session.setAttribute("userName", user.getUserName());
            	 return "success";
            }           
        }
        else{
        	session.setAttribute("userID", null);
        	session.setAttribute("userName", null);
        	return "error";
        }
    }

	/**
     * 用户登出
     * @param id
     * @return
     */
	@RequestMapping(value="/logout")
    public String logout(HttpSession session){
        session.setAttribute("userID", null);
        session.setAttribute("userName", null);
        return "redirect:/page/jumpToHomePage";
    }

	
	/**
     * 添加用户
     * @param user
     * @return
     */
	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(User user){
		if(userService.add(user)=="success"){
			return "success";
		}
		else if(userService.add(user)=="repeat"){
			return "repeat";
			}
		else return "fail";
	}
	
	/**
     * 修改用户信息
     * @param user
     * @return
     */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public String edit(User user){
		if(userService.update(user)=="success"){
			return "success";
		}
		else return "fail";
	}
	
	/**
     * 删除用户
     * @param user
     * @return
     */
	@RequestMapping(value = "/deleteByID")
	@ResponseBody
	public String deleteByID(Integer userID){
		userService.delete(userID);
		return "success";
	}
	
	/**
     * 更改用户额度(提高一级)
     * @param user
     * @return
     */
	@RequestMapping(value = "/levelUp")
	public String levelUp(Integer userID){
		userService.levelUp(userID);
		return "managerIndex";
	}

	/**
     * 更改用户额度（拒绝）
     * @param user
     * @return
     */
	@RequestMapping(value = "/rejectLevelUp")
	public String rejectLevelUp(Integer userID){
		userService.rejectLevelUp(userID);
		return "managerIndex";
	}
}
