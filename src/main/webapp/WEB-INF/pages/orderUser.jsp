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

<title>用户信用审核</title>
<style type="text/css">
	html{
		margin: 0;
		padding: 0;
		height: 100%;
	}

	body {
		margin: 0;
		padding: 0;
		height: 100%;
		margin-bottom:200px;
		background-size: cover;
		}
	
	body, h1, input {
			outline: 0 none;
		}
	.header
	{
		background-image:url('${ctx}/img/hh.jpg');
		padding: 0;
		margin: 0;
		border: 0;
	}
	.foot
	{
		padding: 0;
		margin: 0;
		border: 0;
		position:fixed;
		bottom:0px;
		height:40px;
		width:100%;
  		background-color: white;
	}
	.normalPrint
	{
		color:#0066ff;
		font-size:20px;
		font-family:"微软雅黑";
		font-weight:bold;
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
			margin-bottom: 5px;
			padding-left: 5px;
			padding-right: 5px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 30px;
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
		.btn2 {
			margin: 5px auto;
			display: block;
			border: 10px;
			border-radius: 5px;
			background: #0066ff;
			height: 30px;
			width: 80px;
			color:#fff;
			font-family:"微软雅黑";
			font-size:14px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn2:hover {
			color:#003366;
			border-color:#003366;
		}
		.btn3 {
			margin: 5px auto;
			display: block;
			border: 10px;
			border-radius: 5px;
			background: #0066ff;
			height: 50px;
			width: 200px;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:20px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn3:hover {
			color:#003366;
			border-color:#003366;
		}
table {
		overflow:hidden;
		table-layout:fixed;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:70%;
		margin:2% auto 0;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
	}
	
	th, td {padding:18px 28px 18px; text-align:center; }
	
	th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
	/*
	Background gradients are completely unnecessary but a neat effect.
	*/
	
	td {
		background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
	}
	
	tr.odd-row td {
		background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
	}
	
	th {
		background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
		background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
	}
	
	tr:first-child th.first {
		-moz-border-radius-topleft:5px;
		-webkit-border-top-left-radius:5px; /* Saf3-4 */
	}
	
	tr:first-child th.last {
		-moz-border-radius-topright:5px;
		-webkit-border-top-right-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.first {
		-moz-border-radius-bottomleft:5px;
		-webkit-border-bottom-left-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.last {
		-moz-border-radius-bottomright:5px;
		-webkit-border-bottom-right-radius:5px; /* Saf3-4 */
	}
	
	a:visited{text-decoration:none; color:#000}
	a:hover{ text-decoration:none; color:#000}
	a:link{ text-decoration:none; color:#000}
	a:active{ text-decoration:none; color:#000}
	
	.text1 {
			margin-bottom: 5px;
			padding-left: 5px;
			padding-right: 5px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 80%;
			height: 30px;
			transition: border-color ease .4s;
		}

		.text1:focus {
			border-color:#4d79ff;
		}
</style>

</head>
<body>
<div>
		<div class="header"   style="height:60px;">
			<input class="btn" type="submit" value="返回上一页"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToCreditCheck'" style="width:120px;position:absolute;right:20px;top:5px;"/>
		</div>
		<div>
			<table title="该用户所有订单信息">
	 		<tr>
  				<th>订单ID</th>
  				<th>订单总金额</th>
  				<th>订单分期等级</th>
  				<th>订单状态</th>
  			</tr>
	 	 <c:forEach items="${orderList}"  var="order">
     		<tr>
  				<td>${order.orderID}</td>
  				<td>${order.totalPrice}</td>
  				<td>${order.orderLevel}</td>
  				<td>
					<c:choose>
    					<c:when test="${order.orderState == '1'}">
       						<p style="color:#00b300;font-weight:bold;">等待支付</p>
   						</c:when>
    					<c:when test="${order.orderState=='7'}">
       						<p style="color:#red;font-weight:bold;">已冻结</p>
   						</c:when>
    					<c:when test="${order.orderState=='2'}">
       						<p style="color:#a64dff;font-weight:bold;">等待审核</p>
   						</c:when>
   						<c:when test="${order.orderState=='4'}">
       						<p style="color:#e5e600;font-weight:bold;">未通过审核</p>
   						</c:when>
   						<c:when test="${order.orderState=='5'}">
       						<p style="color: #4d4dff;font-weight:bold;">支付完成</p>
   						</c:when>
   						<c:when test="${order.orderState=='0'}">
       						<p style="color:red;font-weight:bold;">已逾期</p>
   						</c:when>
					</c:choose>
				</td>
	 		</tr>
	 	</c:forEach>
	 </table>
	</div>	
</div>
<div id="payArea" style="width:65%;text-align:right;margin-left:auto;margin-right:auto;">
		<a href="${ctx}/order/passCheck?orderID=${tempOrderID}">
			<input class="btn3" id="recieveButton" type="button" value="通过" style="position:relative;right:20px"/>
		</a>
		<a href="${ctx}/order/rejectCheck?orderID=${tempOrderID}">
			<input class="btn3" id="rejectButton" type="button" value="拒绝" style="position:relative;right:20px"/>
		</a>
</div>
</body>
</html>