<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
 <script src="//code.jquery.com/jquery-1.9.1.js"></script>
 <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
<title>编辑订单页面</title>
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
		window.location.href="${ctx}/page/jumpToOrderManage";
	} 
 	
	$(function(){
		$("#fail").hide();
		
		$("#confirmButton").click(function(){
			//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
			var tempOrderID = $("#orderID").val();
			var tempOrderState = $("#orderState").val();
			
			//用于记录所有的输入是否合法
			var ok1=false;
			
			//较为简单的判断逻辑
			
			if(($("#orderStateInput").val())==""){
				tempOrderState= $("#orderState").val();
				var ok1=true;
			}
			else {
				tempOrderState= $("#orderStateInput").val();
				if(tempOrderState!='1'&&tempOrderState!='0'&&tempOrderState!='3'&&tempOrderState!='4'&&tempOrderState!='5'&&tempOrderState!='7'){
            		ok1=false;
            	}
        		else{
        			ok1=true;
        		}
			}
           	
            if(ok1){			//如有不合法(即为false)则不提交至后台
            	$.ajax({ 							//ajax提交                          	  
				url: ' ${ctx}/order/editState',       
				type: 'POST',
				data: {orderID: tempOrderID, orderState:tempOrderState}, 
				success: function (msg) { 
                    if (msg == "success"){
                    	window.location.href='${ctx}/page/jumpToOrderManage';
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
	<input id="orderID" type="hidden" value="${orderID}">
	<input id="orderState" type="hidden" value="${orderState}">
	
	<div class="container duel">
		
		<div class="input-box-line">
        
        <input class="text" type="text" id="orderStateInput" name="orderState" placeholder="原订单状态：${orderState}"/>
        <input class="btn" type="button" id="confirmButton" value="提交"/>
        <input class="btn" type="button" id="returnButton" value="返回" onclick="re()"/>
        
   </div>
   <label style="width:100%;margin-left:auto;margin-right:auto;color:#fff;" id="orderStateError">*请填写正确的订单状态（0：已逾期；1：等待支付；3：等待人工审核；4：人工审核未通过；5：已支付完成；7：已冻结）</label>
</div>
  <div id="fail" title="error">
  	<p>修改失败！</p>
</div>

</body>
</html>


</body>
</html>