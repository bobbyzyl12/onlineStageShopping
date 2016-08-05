<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css">
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="jqueryui/style.css">
<title>增加用户页面</title>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>

<style type="text/css">
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
		}

		html, body, div, input {
			box-sizing: border-box;
		}

		body {
			background-size: cover;
		}

		body, h1, input {
			color: #fff;
			outline: 0 none;
		}

		::-webkit-input-placeholder {
			color: #cecece;
		}

		.duel {
			width: 100%;
			height: 100%;
		}

		.input-box-line {
			margin-left: auto;
			margin-right: auto;
			position: relative;
			top: 38.2%;
			width: 280px;
			transform: translateY(-38.2%);
			box-sizing: border-box;
		}

		.input-box-line > h1 {
			position: relative;
			left: 240px;
			top: -100px;
			margin-bottom: -50px;
			letter-spacing: 14px;
			height: 50px;
			font-size: 52px;
			font-family: 'FZLTXHK--GBK1-0';
			font-weight: normal;
			color: rgba(255, 255, 255, .6);
		}

		.text {
			margin-bottom: 8px;
			padding-left: 15px;
			padding-right: 15px;
			display: block;
			border: 1px solid #fff;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 42px;
			transition: border-color ease .4s;
		}

		.text:focus {
			border-color: #bdacd3;
		}

		.btn {
			margin: 5px auto;
			display: block;
			border: 1px solid #fff;
			border-radius: 5px;
			background: transparent;
			height: 40px;
			width: 100%;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn:hover {
			color: #bdacd3;
			border-color: #bdacd3;
		}
	</style>
	<script type="text/javascript">
 	function re(){
		window.location.href="${ctx}/page/jumpToGoodsManage";
	}
 	
	$(function(){
		$("#fail").hide();
		$("#goodsNameError").hide();
		$("#goodsPriceError").hide();
		$("#goodsStoreError").hide();
		$("#goodsPictureError").hide();
		$("#goodsDescribeError").hide();
		
		$("#confirmButton").click(function(){
			//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
			var tempGoodsID = $("#goodsID").val();
			var tempGoodsName = $("#goodsName").val();
			var tempGoodsStore =  $("#goodsStore").val();
			var tempGoodsPicture = $("#goodsPicture").val();
			var tempGoodsState =   $("#goodsState").val();
			var tempGoodsPrice =  $("#goodsPrice").val();
			var tempGoodsDescribe =$("#goodsDescribe").val();
			
			$("#goodsNameError").hide();
			$("#goodsStoreError").hide();
			$("#goodsPictureError").hide();
			$("#goodsPriceError").hide();
			$("#goodsDescribeError").hide();
			
			//用于记录所有的输入是否合法
			var ok1=false;
			var ok2=false;
			var ok3=false;
			var ok4=false;
			var ok5=false;
			var ok6=false;
			
			//图片的正则表达式
			var regPic= /[^\s]+\.(jpg|gif|png|bmp)/i;
			
			//价格的正则表达式
			var regPrice=/^(0|([1-9]\d{0,9}(\.\d{1,2})?))$/;
			
			//正整数的正则表达式
			var regStore =/^[0-9]*[1-9][0-9]*$/;
			
			//较为简单的判断逻辑
			if(($("#goodsNameInput").val())==""){
				tempGoodsName= $("#goodsName").val();
				var ok1=true;
			}
			else{
				tempGoodsName= $("#goodsNameInput").val();
				 if(tempGoodsName=="" || tempGoodsName.length<3||tempGoodsName.length>50){
		            	$("#goodsNameError").show();
		                }
		         else
		            {
		        	 ok1=true;
		        	 }
			}
			
			if(($("#goodsPriceInput").val())==""){
				tempGoodsPrice= $("#goodsPrice").val();
				var ok2=true;
			}
			else{
				tempGoodsPrice= $("#goodsPriceInput").val();
				if(!regPrice.test(tempGoodsPrice)&&($("#goodsPicture").val()!='')){
            		$("#goodsPriceError").show();
            	}
        		else{
        			ok2=true;
        		}
			}
            
			if(($("#goodsPictureInput").val())==""){
				tempGoodsPicture= $("#goodsPicture").val();
				var ok3=true;
			}
			else{
				tempGoodsPicture= $("#goodsPictureInput").val();
				 if(!regPic.test(tempGoodsPicture)){
	            	 $("#goodsPictureError").show();
	            }
	        	else{
	        		ok3=true;
	        	}
			}
           
			if(($("#goodsStoreInput").val())==""){
				tempGoodsStore= $("#goodsStore").val();
				var ok4=true;
			}
			else{
				tempGoodsStore= $("#goodsStoreInput").val();
				if(!regStore.test(tempGoodsStore)){
	            	$("#goodsStoreError").show();
	            }
	        	else{
	        		ok4=true;
	        	}
			}
            
			if(($("#goodsDescribeInput").val())==""){
				tempGoodsDescribe= $("#goodsDescribe").val();
				var ok5=true;
			}
			else{
				tempGoodsDescribe= $("#goodsDescribeInput").val();
				ok5=true;
			}
            
			if(($("#goodsStateInput").val())==""){
				tempGoodsState= $("#goodsState").val();
				var ok6=true;
			}
			else{
				tempGoodsState= $("#goodsStateInput").val();
				if(tempGoodsState!='1'&&tempGoodsState!='2'){
	            	$("#goodsStateError").show();
	            }
	        	else{
	        		ok6=true;
	        	}
			}
			
			
           	//创建一个临时的goods变量用于传参
            var tempGoods={'goodsID':tempGoodsID,'goodsName':tempGoodsName,'goodsPrice':tempGoodsPrice,'goodsPicture':tempGoodsPicture,'goodsStore':tempGoodsStore,'goodsDescribe':tempGoodsDescribe,'goodsState':tempGoodsState};
   
            if(ok1&&ok2&&ok3&&ok4&&ok5&&ok6){			//如有一个不合法(即为false)则不提交至后台
            	$.ajax({ 							//提交                          	  
				url: ' ${ctx}/goods/edit',       //处理编辑的页面                 
				type: 'POST',
				data: tempGoods,                
				success: function (msg) { 
                    if (msg == "success"){
                    	window.location.href='${ctx}/page/jumpToGoodsManage';
                      }
					else{
						$("#fail").dialog({
						      modal: true
						    });
					}
					}              
				});    
            }         		  
		});
	});
 </script>
</head>
<body>
	<input id="goodsID" type="hidden" value="${goods.goodsID}">
	<input id="goodsName" type="hidden" value="${goods.goodsName}">
	<input id="goodsPrice" type="hidden" value="${goods.goodsPrice}">
	<input id="goodsPicture" type="hidden" value="${goods.goodsPicture}">
	<input id="goodsDescribe" type="hidden" value="${goods.goodsDescribe}">
	<input id="goodsStore" type="hidden" value="${goods.goodsStore}">
	<input id="goodsState" type="hidden" value="${goods.goodsState}">
	<div class="container duel">
		<div class="input-box-line">
		<label style="width:100px;text-align:right;color:white;" id="goodsNameError">*请填写3-50位的商品名</label>
        <input class="text" type="text" id="goodsNameInput" name="goodsName" placeholder="原商品名：${goods.goodsName}"/>
        
        <label style="width:100px;text-align:right;color:white;" id="goodsPriceError">*请正确填写商品价格</label>
        <input class="text" type="text" id="goodsPriceInput" name="goodsPrice" placeholder="原商品价格：${goods.goodsPrice}"/>
        
        <label style="width:100px;text-align:right;color:white;" id="goodsStoreError">*请正确填写商品库存</label>
        <input class="text" type="text" id="goodsStoreInput" name="goodsStore" placeholder="原商品库存：${goods.goodsStore}"/>
        
         <label style="width:100px;text-align:right;color:white;" id="goodsPictureError">*请正确填写图片名</label>
        <input class="text" type="text" id="goodsPictureInput" name="goodsPicture" placeholder="原图片名：${goods.goodsPicture}"/>
        
         <label style="width:100px;text-align:right;color:white;" id="goodsDescribeError">*请正确填写图片描述</label>
        <input class="text" type="text" id="goodsDescribeInput" name="goodsDescribe" placeholder="原商品描述：${goods.goodsDescribe}"/>
        
         <label style="width:100px;text-align:right;color:white;" id="goodsStateError">*1：正常；2：已下架</label>
        <input class="text" type="text" id="goodsStateInput" name="goodsState" placeholder="商品状态：${goods.goodsState}"/>
        
        <input class="btn" type="button" id="confirmButton" value="提交"/>
        <input class="btn" type="button" id="returnButton" value="返回" onclick="re()"/>
   </div>
</div>
 <div id="fail" title="error">
  	<p>增加失败</p>
</div>
</body>
</html>