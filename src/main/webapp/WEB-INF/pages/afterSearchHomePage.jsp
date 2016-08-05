<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<title>home page</title>
<style type="text/css">

	html, body{
		margin: 0;
		padding: 0;
		height: 100%;
	}

	body {
		margin-bottom: 0px;
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
		position:relative;
  		bottom: 0px;
  		left: 0px;
  		height: 50px;
  		background-color: white;
 		width: 100%;
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
		.goodsDiv{
			margin:10px;
			padding:10px;
			width:250px;
			display:inline-block;
		}
		
		.goodsDiv:hover{
			box-shadow:0px 0px 10px 5px #ccc;
		}
		.goodsName
		{
			font-size:18px;
			font-family:"微软雅黑";
			position:relative;
		}
		.goodsPrice
		{
			font-weight: bold;
			color:#0066ff;
			font-size:20px;
			font-family:"微软雅黑";
		}
		
		a:link {color:#000;text-decoration:none;} 
		a:visited {color:#000;text-decoration:none;}  
		a:hover {color:grey;} 
</style>
<script type="text/javascript">
$(function(){
	$("#searchButton").click(function(){
		var temp = $("#searchBox").val();
		
	});
});


 </script>
</head>
<body>
	<div>
		<div class="header" style="height:60px;">
	 		<form action="${ctx}/goods/search" method="post">
				<input class="text" type="text" id="searchBox" name="searchBox"  placeholder="搜索内容" style="width:50%;position:relative;left:80px;color:#fff;height:40px;top:10px"/>
        		<input class="btn" type="submit" value="搜索" name="searchButton" id="searchButton" style="width:100px;position:relative;left:180px;top:-40px"/>
			</form>
				<%
				if(session.getAttribute("userName") == null){%>
				<input class="btn" type="submit" value="注册" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToSignin'" style="width:80px;position:absolute;right:20px;top:5px;"/>
				<input class="btn" type="submit" value="登陆"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToLogin'" style="width:80px;position:absolute;right:120px;top:5px;"/>
				<%}
				else{%>
				<input class="btn" type="submit" value="我的订单" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToMyOrder'" style="width:120px;position:absolute;right:20px;top:5px;"/>
				<input class="btn" type="submit" value="我的购物车"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToMyCart'" style="width:120px;position:absolute;right:150px;top:5px;"/>
				<input class="btn" type="submit" value="我的信息"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToMyInfo'" style="width:120px;position:absolute;right:280px;top:5px;"/>
				<%}
				%>
		</div>
	</div>
	<div style="vertical-align:middle;position:relative;top:0px;margin:30px;height:auto"> 
		<c:forEach items="${goodsList}"  var="goods">
			<div class="goodsDiv">
			<center>
				<a href="${ctx}/page/jumpToGoodsDetail?goodsID=${goods.goodsID}">
					<img src="${ctx}/img/${goods.goodsPicture}"  style="width:200px;height:200px;"/>
				</a>
				<a href="${ctx}/page/jumpToGoodsDetail?goodsID=${goods.goodsID}">
					<p style="line-height:20px" class="goodsName">${goods.goodsName}</p>
				</a>
					<p class="goodsPrice">￥&nbsp;&nbsp;${goods.goodsPrice}</p>
  					<input type="button" class="btn2" style="width:100px" value="详细页面" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToGoodsDetail?goodsID=${goods.goodsID}'">
			</center>
			</div>
		</c:forEach>
    </div>
	<div class="foot">	
		<p style="font-size:15px;text-align:center;color:#666666">趣分期系统</p>
	</div>
</body>
</html>