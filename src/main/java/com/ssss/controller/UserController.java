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
     * �����Ϣ(�û�ע��)
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
     * �û���½
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
     * �û��ǳ�
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
     * ����û�
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
     * �޸��û���Ϣ
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
     * ɾ���û�
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
     * �����û����(���һ��)
     * @param user
     * @return
     */
	@RequestMapping(value = "/levelUp")
	public String levelUp(Integer userID){
		userService.levelUp(userID);
		return "managerIndex";
	}

	/**
     * �����û���ȣ��ܾ���
     * @param user
     * @return
     */
	@RequestMapping(value = "/rejectLevelUp")
	public String rejectLevelUp(Integer userID){
		userService.rejectLevelUp(userID);
		return "managerIndex";
	}
}
