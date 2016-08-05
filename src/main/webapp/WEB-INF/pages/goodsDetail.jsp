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
<title></title>
<style type="text/css">
	
	html, body{
		margin: 0;
		padding: 0;
		height: 100%;
		overflow-x:hidden;
	}

	body {
			background-size: cover;
		}
	
	body, h1, input {
			outline: 0 none;
		}
	.header
	{
		background-image:url('${ctx}/img/h.jpg');
		padding: 0;
		margin: 0;
		border: 0;
	}
	.foot
	{
		padding: 0;
		margin: 0;
		border: 0;
		position:absolute;
		bottom:0px;
		height:40px;
		width:100%;
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
		.text1 {
			margin-bottom: 8px;
			padding-left: 15px;
			padding-right: 15px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 42px;
			transition: border-color ease .4s;
		}

		.text1:focus {
			border-color:#4d79ff;
		}
		

		.btn {
			color: #fff;
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
		.btn1 {
			margin: 5px auto;
			display: block;
			border: 0px;
			border-radius: 5px;
			background: #0066ff;
			height: 50px;
			width: 100%;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:18px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn1:hover {
			color:#003366;
			border-color:#003366;
		}
		
		.btn2 {
			margin: 5px auto;
			display: block;
			border: 0px;
			border-radius: 5px;
			background: #0066ff;
			height: 40px;
			width: 100%;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:18px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn2:hover {
			color:#003366;
			border-color:#003366;
		}
		.searchbutton {
    		background:#2952cc;
			display: inline-block;
			padding: 5px 10px 6px;
			color: #fff;
			text-decoration: none;
			line-height: 1;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			-moz-box-shadow: 0 1px 3px #999;
			-webkit-box-shadow: 0 1px 3px #999;
			text-shadow: 0 -1px 1px #222;
			border-bottom: 1px solid #222;
			position: relative;
			cursor: pointer;
			font-size:20px;
		}
		.detailTitle
		{
			font-size:20px;
			color:#0066ff;
			font-weight:bold;
			font-family:"微软雅黑";
		}
</style>
<script type="text/javascript">
function toDecimal(x) { 
    var f = parseFloat(x); 
    if (isNaN(f)) { 
      return; 
    } 
    f = Math.round(x*100)/100; 
    return f; 
  } 
  
$(function(){
	  $("#unlogin").hide();
	  $("#fail").hide();
	  $("#noInt").hide();
	  $("#noNum").hide();
	  $("#noStore").hide();
});

$(document).ready(function(){
	
	  $("#addCart").click(function(){
		  var stageLevel = document.getElementById("stageOption").value;
		  var quantity=$("#quantity").val();	//获取输入的数量
		  var goodsID=$("#goodsID").val(); 
		  var ifInt = /^[0-9]*[1-9][0-9]*$/;
		  var store =$("store").val();
		  var state =$("goodsState").val();
		  $("#unlogin").hide();
		  $("#fail").hide();
		  $("#noInt").hide();
		  $("#noNum").hide();
		  $("#noStore").hide();
		  if(quantity==null){ 
			  	$("#noNum").dialog({
				modal: true
			});}
		  
		  else if(!(ifInt.test(quantity))){
			  $("#noInt").dialog({
				modal: true
				});
		  }
		  else if(store==0||state=='2'){
			  $("#noStore").dialog({
					modal: true
					});
		  }
		  else{ 
			$.ajax({    							//异步提交                       	  
			url: '${ctx}/goods/addIntoCart',                        
			type: 'POST',                  
			data: {goodsID: goodsID, quantity:quantity,stageLevel:stageLevel},                      
		  	success: function (msg){ 
            	if (msg == "success"){
              		window.location.href='${ctx}/page/jumpToHomePage';
                }
            	else if(msg="unlogin")
            	{
            		$("#unlogin").dialog({
                  	modal: true
                  		    });
            	}
				else{
					$("#fail").dialog({
					modal: true
				});
			}
		}   	
		  });  }
			  
	  });
	});
 </script>
</head>
<body>
<div>
	<input id="goodsID" type="hidden" value="${goodsID}">
	<input id="goodsState" type="hidden" value="${goodsState}">
	<div>
		<div class="header" style="height:60px;">
	 		<form action="${ctx}/goods/search" method="post">
				<input class="text" type="text" id="searchBox" name="searchBox" placeholder="搜索内容" style="width:50%;position:relative;left:100px;color:#fff;height:40px;top:10px"/>
        		<input class="btn" type="submit" value="搜索" name="searchButton" id="searchButton" style="width:100px;position:relative;left:200px;top:-40px"/>
			</form>
				<%
				if(session.getAttribute("userName") == null){%>
				<input class="btn" type="submit" value="注册" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToSignin'" style="width:80px;position:absolute;right:20px;top:5px;"/>
				<input class="btn" type="submit" value="登陆"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToLogin'" style="width:80px;position:absolute;right:120px;top:5px;"/>
				<%}
				else{%>
				<input class="btn" type="submit" value="我的订单" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToMyOrder'" style="width:120px;position:absolute;right:20px;top:5px;"/>
				<input class="btn" type="submit" value="我的购物车"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToMyCart'" style="width:120px;position:absolute;right:150px;top:5px;"/>
				<%}
				%>
		</div>
	</div>
	<div style="height:500px;">
		<div style="position:relative;left:150px;height:450px;top:80px">
			<img  style="width:400px;height:400px;border:1px" src="${ctx}/img/${goodsPicture}">
		</div>
		<div style="position:relative;left:625px;height:50px;top:-400px">
			<p style="font-size:32px;color:#000;font-weight:bold;font-family:'微软雅黑'">${goodsName}</p>
			<p style="font-size:20px;color:#000;position:relative;font-family:'微软雅黑'">单件总价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;￥&nbsp;${goodsPrice}</p>
			<p style="font-family:'微软雅黑';color:#4d4d4d;font-size:15px;position:relative;">商品编号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${goodsID}</p>
			<div>
				<p style="font-family:'微软雅黑';color:#4d4d4d;font-size:14px;position:relative;top:10px;">分期：</p>
				<select id="stageOption" style="color:#0052cc;font-family:'微软雅黑';position:relative;left:70px;top:-25px;width:200px;height:30px;font-size:20px;">
  					<c:forEach items="${optionList}"  var="stageSelect" >
  						<option value="${stageSelect.stageLevel}">￥${stageSelect.perPrice}&nbsp;X&nbsp;${stageSelect.stageNum}期</option>
  					</c:forEach>
				</select>
			</div>
			<div>
				<p style="font-family:'微软雅黑';color:#4d4d4d;font-size:14px;position:relative;">数量：</p>
				<div style="display: inline-block;">
					<input class="text1" type="text" id="quantity" name="quantity" placeholder="填写数量" style="font-family:'微软雅黑';color:#4d4d4d;font-size:14px;position:relative;top:-50px;left:70px;width:180px;display: inline-block;"/>
					<p style="font-family:'微软雅黑';color:#4d4d4d;font-size:14px;position:relative;top:-50px;left:90px;display: inline-block;">库存：&nbsp;${goodsStore}</p>
					<input id="store" value="${goodsStore}" hidden="hidden">
				</div>
			</div>
			<input class="btn1" type="button" value="加入购物车" id="addCart" style="position:relative;top:-20px;left:-300px;font-size:20px;height:60px;width:300px;"/>
		</div>
	</div>
	
	<div style="position:relative;left:200px;top:40px;height:400px;">
		<p class="detailTitle">详细信息</p>
		<div style="border:3px solid;padding:10px;border-color:#0066ff;width:900px;height:70%; border-radius:15px;">
			<p>
			${goodsDescribe}
			</p>
		</div>
	</div>
	
</div>
<div id="unlogin" title="提示">
  	<p>请先登陆</p>
</div>
<div id="fail" title="提示">
  	<p>添加失败，请重新尝试</p>
</div>
<div id="noInt" title="提示">
	<p>请填写整数！</p>
</div>
<div id="noNum" title="提示">
	<p>请填写数量</p>
</div>
<div id="noStore" title="提示">
	<p>商品已无库存</p>
</div>
</body>
</html>