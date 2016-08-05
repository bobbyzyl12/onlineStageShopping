package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;

@Controller
@RequestMapping(value="/goods")
public class GoodsController {
	@Autowired
	@Qualifier(value="goodsService")
	private GoodsService goodsService;
	
	/**
     * 添加信息(商品)
     * @param goods
     * @return
     */
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public String add(Goods goods){
		goodsService.add(goods);
		return "success";
		
	}
	
	/**
     * 修改商品信息
     * @param goods
     * @return
     */
	@RequestMapping(value = "/edit")
	@ResponseBody
	public String edit(Goods goods){
		if(goodsService.update(goods)=="success"){
			return "success";
		}
		else return "fail";
	}
	

	/**
     * 将商品增加到购物车中
     * @param goods
     * @return
     */
	@RequestMapping(value = "/addIntoCart",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String addIntoCart(@RequestParam(value = "goodsID") Integer goodsID,@RequestParam(value = "quantity") Integer quantity,@RequestParam(value = "stageLevel") Integer stageLevel,HttpSession session){
		Integer cartID= (Integer) session.getAttribute("userID");
		
		if(cartID==null) return "unlogin";
		
		GoodsInCart temp = new GoodsInCart(cartID,goodsID,quantity,stageLevel);
		temp.setCartID(cartID);
		temp.setGoodsID(goodsID);
		temp.setQuantity(quantity);
		temp.setStageLevel(stageLevel);
		String result= goodsService.addIntoCart(temp);
		if(result =="success"){
			return "success";
		}
		else return "fail";
	}
	
	/**
     * 将商品从购物车中删除
     * @param goods
     * @return
     */
	@RequestMapping(value = "/deleteGoodsInCart")
	public String deleteGoodsInCart(@RequestParam(value = "goodsID") Integer goodsID,@RequestParam(value = "stageLevel") Integer stageLevel,HttpSession session){
		Integer cartID= (Integer) session.getAttribute("userID");
		Integer quantity = 0;
		
		//打包参数
		GoodsInCart temp = new GoodsInCart(cartID,goodsID,quantity,stageLevel);
		temp.setCartID(cartID);
		temp.setGoodsID(goodsID);
		temp.setQuantity(quantity);
		temp.setStageLevel(stageLevel);
		goodsService.deleteGoodsInCart(temp);
		
		return "redirect:/page/jumpToMyCart";
	}
	
	
	/**
     * 将修改购物车中的商品
     * @param goods
     * @return
     */
	@RequestMapping(value = "/editGoodsInCart",method={RequestMethod.POST,RequestMethod.GET})
	public String editGoodsInCart(@RequestParam(value = "goodsID") Integer goodsID,@RequestParam(value = "quantity") Integer quantity,@RequestParam(value = "stageLevel") Integer stageLevel,HttpSession session){
		Integer cartID= (Integer) session.getAttribute("userID");
		
		GoodsInCart temp = new GoodsInCart(cartID,goodsID,quantity,stageLevel);
		temp.setCartID(cartID);
		temp.setGoodsID(goodsID);
		temp.setQuantity(quantity);
		temp.setStageLevel(stageLevel);
		String result= goodsService.editGoodsInCart(temp);
		
		if(result =="success"){
			return "redirect:/page/jumpToMyCart";
		}
		else return "fail";
	}
	
	/**
     * 通过goodsID查Goods
     * @param goods
     * @return
     */
	@RequestMapping(value = "/findByID",method = RequestMethod.POST)
	@ResponseBody
	public Goods findByID(Integer goodsID){
		return goodsService.findByID(goodsID);
	}
	
	/**
     * 搜索商品
     * @param goods
     * @return
     */
	@RequestMapping(value = "/search")
	public String search(@RequestParam(value = "searchBox") String searchBox,Map<String, Object> map){
		String res="%"+searchBox+"%";
		List<Goods> goodsList = goodsService.search(res);
		map.put("goodsList", goodsList);
		if(goodsList!=null){
			return "afterSearchHomePage";	
		}
		else return null;
	}
	
	
	
}
