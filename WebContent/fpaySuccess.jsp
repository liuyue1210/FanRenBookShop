<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page
	import="com.ssh.shop.po.User,com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买成功</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
.top {
	border-bottom: 3px solid #ff2832;
}

.tTop {
	height: 34px;
	background: #f9f9f9;
	border-bottom: 1px solid #f2f2f2;
}

.tTop div {
	line-height: 34px;
	color: #646464;
	font-size: 12px;
	font-family: 'Hiragino Sans GB', "simsun", "Arial";
}

.tTop .tTop1 {
	float: left;
	text-align: left;
	margin-left: 10px;
}

.tTop .tTop2 {
	float: right;
	text-align: right;
	margin-right: 10px;
}

.tTop a {
	text-decoration: none;
	color: #646464;
}

.tTop a:hover, .tTop .on {
	color: red;
}

.tBottom {
	margin-top: 15px;
	height: 90px;
}

.tBottom div {
	width: 250px;
	height: 90px;
	background: url(image/logo2.jpg);
	float: left;
}

.tBottom span {
	display: block;
	width: 206px;
	text-align: center;
	float: right;
	margin-top: 30px;
	background: #eee;
	color: #646464;
	font: bold 14px/36px "Microsoft Yahei";
	margin-left: 7px;
}

.tBottom .spanOn {
	background: #F63;
	color: #fff;
}

.medium {
	border: 4px solid #f5f5f5;
	overflow: auto;
	margin-top: 20px;
	height: 200px;
	padding: 60px;
}

.medium p {
	margin-top: 20px;
	font-size: 16px;
	line-height: 24px;
}

.medium div {
	text-align: right;
	margin: 30px 50px;
}

.medium a {
	color: #555;
	text-decoration: none;
}

.medium a:hover {
	color: #f00;
	text-decoration: underline;
}

.bottom {
	clear: both;
	margin-top: 10px;
	width: 100%;
	text-align: center;
	height: 34px;
	background: #f9f9f9;
	color: #646464;
	font-size: 12px;
	font-family: 'Hiragino Sans GB', "simsun", "Arial";
	line-height: 34px;
	border-top: 2px solid #ff2832;
}
</style>
<script>
	
</script>
</head>
<body>
	<%
		boolean isLogin = false;
		User user = (User) session.getAttribute("user");
		if (user != null) {
			isLogin = true;
		}
	%>
	<!--网页顶部，常用（含导航、logo、购物车、登录注册跳转、个人信息跳转等等）-->
	<div class="top">
		<div class="tTop">
			<div>
				<a href="fmain.jsp">首页</a> <span class="tTop1"><marquee
						width="900">				<s:property value="#session.notification.notice" />
</marquee></span> <span class="tTop2">欢迎光临网上书店，
					<%
 	if (!isLogin) {
 %> <a href="login.jsp" class="on">请登录</a> ／<a href="register.jsp">注册</a>
					<%
						} else {
					%> <a href="fpersonInfo.jsp"><s:property
							value="#session.user.userName" /></a> <a href="logout" class="on">退出登录</a>
					<%
						}
					%>
				</span>
			</div>
		</div>
		<div class="tMedium">
			<span class="logo"></span>
			<div class="search">
				<form method="post" action="searchBookAction">
					<input type="text" placeholder="可根据书名作者或者类别进行模糊查询" class="info"
						name="condition" /> <input type="submit" class="query" value="" />
				</form>
			</div>
			<span class="shoppingCartAndOrder"> <a href="showShoppingCart"
				class="shoppingCart">购物车</a>
			</span>
		</div>
	</div>
	<!--网页中部，订单提交成功信息-->
	<div class="medium">
		<center>
			<h1>结算成功</h1>
			<p>恭喜您购买成功，相关书籍已添加至书架！</p>
		</center>
		<div>
			<a href="showBookShelf">我的书架</a>
		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
