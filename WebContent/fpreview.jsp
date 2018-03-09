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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
.medium span {
	display: inline-block;
	border: 1px solid #966;
	border-radius: 5px;
	padding: 5px 10px;
}

.previewContent {
	margin-top: 10px;
	overflow: hidden;
	height: 600px;
	border: 1px solid #36F;
	padding: 20px;
}

.moreBuy {
	text-align: right;
}

.moreBuy a {
	text-decoration: none;
	color: #000;
	font-size: 14px;
}

.moreBuy a:hover {
	color: #F00;
	text-decoration: underline;
}
</style>
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
	<!--网页中部、可变（全部图书分类不变），此处含有图书分类、图书详情-->
	<div class="medium">
		<div>
			<center>
				<!-- 书名 -->
				<span>${book.bookName }</span>
			</center>
		</div>
		<!-- 预览内容 -->
		<div class="previewContent">${text }</div>
		<div class="moreBuy">
			<a href="buyNow?bookid=${book.bookID }">预览后文，请购买...</a>
		</div>

	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
