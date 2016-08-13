<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
	html, body{
		margin: 0;
		padding: 0;
		height: 100%;
		box-sizing: border-box;
	}
	
	.layout-total{
		height: 100%;
		background-color:grey;
		margin:none;
	}
	
	.layout-mainPlayArea
	{
		height:66%;
		width:90%;
		position:relative;
		top:2%;
		left:5%;
		background-color:red;
		margin:0px 0px 0px 0px;
	}
	
	.layout-footArea
	{
		height:33%;
		width:90%;
  		position: relative;
  		left:5%;
  		top:0%;
 		background-color:blue;
	}
	
	.layout-myPicture{
		height:90%;
		width:18%;
  		position: relative;
  		left:2%;
  		top:5%;
 		background-color:pink;
	}
	
	.layout-otherPlayer{
		height:90%;
		width:18%;
		position: absolute;
  		left:2%;
  		top:5%;
		background-color:white;
	}
	
	.layout-battleArea{
		height:90%;
		width:75%;
  		margin-left:22%;
  		position:absolute;
  		top:5%;
		background-color:black;
	}
	
	.layout-stageArea{
		height:20%;
		width:100%;
		position:absolute;
		top:0px;
		background-color:purple;
	}
	
	.layout-linkArea{
		height:80%;
		width:100%;
		position:absolute;
		bottom:0px;
		background-color:green;
	}
	
	.layout-cardArea{
		height:90%;
		width:75%;
  		margin-left:22%;
  		position:absolute;
  		top:5%;
		background-color:yellow;
	}
</style>
<body>
	<div class= "layout-total">
		<div class="layout-mainPlayArea">
			<div class="layout-otherPlayer">
			</div>
			<div class="layout-battleArea">
				<div class="layout-stageArea">
				</div>
				<div class="layout-linkArea">
				</div>
			</div>
		</div>
		<div class = "layout-footArea">
			<div class="layout-myPicture">
			
			</div>
			<div class="layout-cardArea">
			
			</div>
		</div>
	</div>
</body>

</html>