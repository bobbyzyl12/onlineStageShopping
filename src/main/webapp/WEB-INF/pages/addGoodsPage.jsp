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
		$("#goodsStateError").hide();
		$("#goodsDescribeError").hide();
		
		$("#confirmButton").click(function(){
			//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
			var tempGoodsName = $("#goodsName").val();
			var tempGoodsStore =  $("#goodsStore").val();
			var tempGoodsPicture = $("#goodsPicture").val();
			var tempGoodsState =  Number(1);
			var tempGoodsPrice =  $("#goodsPrice").val();
			var tempGoodsDescribe =$("#goodsDescribe").val();
			
			$("#goodsNameError").hide();
			$("#goodsStoreError").hide();
			$("#goodsPictureError").hide();
			$("#goodsStateError").hide();
			$("#goodsPriceError").hide();
			$("#goodsDescribeError").hide();
			
			//用于记录所有的输入是否合法
			var ok1=false;
			var ok2=false;
			var ok3=false;
			var ok4=false;
			
			//图片的正则表达式
			var regPic= /[^\s]+\.(jpg|gif|png|bmp)/i;
			
			//价格的正则表达式
			var regPrice=/^(0|([1-9]\d{0,9}(\.\d{1,2})?))$/;
			
			//正整数的正则表达式
			var regStore =/^[0-9]*[1-9][0-9]*$/;
			
			//较为简单的判断逻辑
			 if(tempGoodsName=="" || tempGoodsName.length<3||tempGoodsName.length>50){
            	$("#goodsNameError").show();
                }
            else{ok1=true;}
         
            if(!regPrice.test(tempGoodsPrice)&&($("#goodsPicture").val()!='')){
            	$("#goodsPriceError").show();
            }
            else if($("#goodsPicture").val()==''){
            	tempGoodsPicture=null;
            }
        	else{ok2=true;}
            
            if(!regPic.test(tempGoodsPicture)){
            	 $("#goodsPictureError").show();
            }
        	else{ok3=true;}
            
            if(!regStore.test(tempGoodsStore)){
            	$("#goodsStoreError").show();
            }
        	else{ok4=true;}
            
           	//创建一个临时的user变量用于传参
            var tempGoods={'goodsName':tempGoodsName,'goodsPrice':tempGoodsPrice,'goodsPicture':tempGoodsPicture,'goodsStore':tempGoodsStore,'goodsDescribe':tempGoodsDescribe,'goodsState':tempGoodsState};
   
            if(ok1&&ok2&&ok3&&ok4){			//如有一个不合法(即为false)则不提交至后台
            	$.ajax({ 							//提交                          	  
				url: ' ${ctx}/goods/add',       //处理增加用户的页面                 
				type: 'POST',
				data: tempGoods,                
				success: function (msg) { 
                    if (msg == "success"){
                    	alert("success");
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
	<div class="container duel">
		<div class="input-box-line">
		<label style="width:100px;text-align:right;color:white;" id="goodsNameError">*请填写3-50位的商品名</label>
        <input class="text" type="text" id="goodsName" name="goodsName" placeholder="商品名"/>
        
        <label style="width:100px;text-align:right;color:white;" id="goodsPriceError">*请正确填写商品价格</label>
        <input class="text" type="text" id="goodsPrice" name="goodsPrice" placeholder="商品价格"/>
        
        <label style="width:100px;text-align:right;color:white;" id="goodsStoreError">*请正确填写商品库存</label>
        <input class="text" type="text" id="goodsStore" name="goodsStore" placeholder="商品库存"/>
        
         <label style="width:100px;text-align:right;color:white;" id="goodsPictureError">*请正确填写图片名</label>
        <input class="text" type="text" id="goodsPicture" name="goodsPicture" placeholder="图片名"/>
        
         <label style="width:100px;text-align:right;color:white;" id="goodsDescribeError">*请正确填写图片描述</label>
        <input class="text" type="text" id="goodsDescribe" name="goodsDescribe" placeholder="图片描述"/>
        
        <input class="btn" type="button" id="confirmButton" value="提交"/>
        <input class="btn" type="button" id="returnButton" value="返回" onclick="re()"/>
   </div>
</div>
 <div id="fail" title="提示">
  	<p>增加失败</p>
</div>
</body>
</html>