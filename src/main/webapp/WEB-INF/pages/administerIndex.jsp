<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<title>登录页面</title>
<style type="text/css">
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			overflow-y:hidden;
		}

		html, body, div, input {
			box-sizing: border-box;
			text-align:center;
		}

		body {
			background-image: url(${ctx}/img/bg1.jpg);
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
function toUserManage (){ 
	var a = document.getElementById("i"); 
	a.src = "${ctx}/page/jumpToUserManage"; 
}

function toGoodsManage (){ 
	var a = document.getElementById("i"); 
	a.src = "${ctx}/page/jumpToGoodsManage"; 
}

function toOrderManage (){ 
	var a = document.getElementById("i"); 
	a.src = "${ctx}/page/jumpToOrderManage"; 
}

 </script>
</head>
<body>
	<div class="cover-image"></div>
	<div style="position:absolute;left:20px;top:100px;height:auto;width:200px">
		<input class="btn" type="button" value="用户信息管理" id="userManageButton" onclick="toUserManage()"/>
        <input class="btn" type="button" value="商品信息管理" id="goodsManageButton" onclick="toGoodsManage()"/>
        <input class="btn" type="button" value="订单信息管理" id="orderManageButton" onclick="toOrderManage()"/>
    </div>
    <div id="workArea" style="position:absolute;left:300px;top:70px;width:1000px;height:600px"> 
    	<iframe id="i" width="1000px" height="600px"frameborder="no" border="0" marginwidth="0" marginheight="0" allowtransparency="yes"></iframe>
    </div>
</body>
</html>