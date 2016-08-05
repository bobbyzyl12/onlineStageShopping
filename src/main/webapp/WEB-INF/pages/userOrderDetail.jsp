<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<title>用户信息管理页面</title>
<style type="text/css">
	html, body, div, span, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	abbr, address, cite, code,
	del, dfn, em, img, ins, kbd, q, samp,
	small, strong, sub, sup, var,
	b, i,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td {
		margin:0;
		padding:0;
		border:0;
		outline:0;
		font-size:100%;
		vertical-align:baseline;
		background:transparent;
	}
	
	body {
		margin:0;
		padding:0;
		font:12px/15px "Helvetica Neue",Arial, Helvetica, sans-serif;
		color: #555;
	}
	
	a {color:#666;}
	
	#content {width:65%; max-width:690px; margin:6% auto 0;}
	
	/*
	Pretty Table Styling
	CSS Tricks also has a nice writeup: http://css-tricks.com/feature-table-design/
	*/
	
	table {
		overflow:hidden;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:70%;
		margin:5% auto 0;
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
	
	.normalbutton {
       	width:100px;
    	height:35px;
    	background-color: #999999;
    	color: #ffffff;
    	font-size:16px;
    	font-family:"微软雅黑";
    	cursor: hand;
    	text-decoration: none;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
		border-bottom: 1px solid rgba(0,0,0,0.25);
		}
		
		.smallbutton {
       	width:60px;
    	height:30px;
    	background-color: #999999;
    	color: #ffffff;
    	font-size:12px;
    	font-family:"微软雅黑";
    	cursor: hand;
    	text-decoration: none;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
		border-bottom: 1px solid rgba(0,0,0,0.25);
		}
</style>

</head>
<body>
	<div style="text-align:center;position:absolute;top:30px;width:auto">
		<input class="normalbutton" type="button" value="添加用户" id="addUser" onclick="addOpen()" >
	</div>
	<div>
		<table id="tab" style="text-align:center;position:absolute;top:50px;width:1000px">
  			<tr>
  				<th>用户ID</th>
  				<th>用户名</th>
  				<th>密码</th>
  				<th>电话</th>
  				<th>邮箱</th>
  				<th>用户信用额度</th>
  				<th>用户状态</th>
  				<th>修改</th>
  				<th>删除</th>
  			</tr>
  			 <c:forEach items="${userList}"  var="user">
     			<tr>
  				<td>${user.userID}</td>
  				<td>${user.userName}</td>
  				<td>${user.userPwd}</td>
  				<td>${user.userPhone}</td>
  				<td>${user.userEmail}</td>
  				<td>${user.userCredit}</td>
  				<td>${user.userState}</td>
  				<td>
  					<a href="${ctx}/page/jumpToEditUserPage?userID=${user.userID}" class="smallbutton"><button>修改</button></a>
  				</td>
  				<td>
  					<a href="${ctx}/page/jumpToDeleteUserPage?userID=${user.userID}" class="smallbutton"><button>删除</button></a>
  				</td>
  			</tr>
   			</c:forEach> 
  		</table>	
	</div>
<script type="text/javascript">

function addOpen(){
	window.location.href="${ctx}/page/jumpToAddUserPage";
}

 </script>
</body>
</html>