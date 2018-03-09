<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page
	import="com.ssh.shop.po.User,com.opensymphony.xwork2.ActionContext"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书详情</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
.where {
	height: 30px;
	line-height: 30px;
}

.font1, .font2, .font4 {
	font-size: 12px;
	font-family: "simsun";
}

.font1, .font3 {
	color: #646464;
}

.font2 {
	color: #323232;
}

.font3 {
	font-size: 14px;
	font-family: "Microsoft Yahei";
	font-weight: 600;
}

.font4 {
	color: #1a66b3;
}

.bookBox {
	width: 970px;
	height: 430px;
}

.bBLeft {
	width: 320px;
	height: 390px;
	float: left;
	padding: 20px;
}

.bBLeft img {
	width: 320px;
	height: 360px;
}

.bBRight {
	width: 570px;
	height: 390px;
	float: left;
	padding: 20px;
}

.bBRight .h1 {
	height: 30px;
	font-size: 18px;
	color: #323232;
	font-family: "Verdana", "Microsoft Yahei";
	font-weight: 900;
	line-height: 24px;
}

.bBRight .h2 {
	height: 72px;
	font-size: 16px;
	color: #323232;
	line-height: 24px;
	overflow: hidden;
}

.bBRight .h3 {
	margin-top: 15px;
	border-top: 1px solid #f5f5f5;
	padding-top: 5px;
}

.bBRight .h3 span {
	margin-right: 25px;
}

.bBRight .h4 {
	margin-top: 20px;
	padding-top: 20px;
	padding-bottom: 5px;
	padding-left: 3px;
	background: #ebebeb;
	font-size: 12px;
	margin-bottom: 30px;
}

.bBRight .h4 span {
	margin-right: 10px;
}

.bBRight .h4 .h41 {
	color: #e52222;
}

.bBRight .h4 .h411 {
	font-size: 26px;
}

.bBRight .h4 .h42 {
	color: #969696;
}

.bBRight .h5, .bBRight .h6 {
	font-size: 14px;
	color: #666;
}

.bBRight .h5 {
	padding-top: 11px;
}

.bBRight .h6 {
	margin-top: 20px
}

.bBRight .h5 span, .bBRight .h6 span {
	margin-right: 30px;
}

.bBRight .h7 {
	margin-top: 40px;
}

.bBRight .h7 .h71, .bBRight .h7 .h72, .bBRight .h7 .h73 {
	margin-right: 10px;
	float: left;
}

.bBRight .h7 .h71 {
	height: 34px;
	width: 62px;
}

.bBRight .h7 .h71 .num {
	width: 38px;
	height: 32px;
	border: 1px solid #ccc;
	line-height: 32px;
	text-align: center;
	color: #666;
	float: left;
}

.bBRight .h7 .h71 a {
	display: block;
	text-decoration: none;
	width: 20px;
	height: 15px;
	background: #eee;
	line-height: 15px;
	text-align: center;
	float: left;
	border: 1px solid #ccc;
}

.bBRight .h7 .h72 a, .bBRight .h7 .h73 a {
	display: block;
	font-size: 16px;
	font-family: "Microsoft Yahei";
	border-radius: 3px;
	text-decoration: none;
}

.bBRight .h7 .h72 a {
	width: 150px;
	height: 34px;
	background: url(image/shoppingCart1.png) no-repeat 10px center #ff2832;
	line-height: 34px;
	text-indent: 50px;
	color: #fff;
}

.bBRight .h7 .h72 a:hover {
	background: url(image/shoppingCart1.png) no-repeat 10px center #f00000;
}

.bBRight .h7 .h73 a {
	width: 100px;
	height: 32px;
	background: #ffedee;
	line-height: 32px;
	color: #ff2832;
	border: 1px solid #ff2832;
	text-align: center;
}

.bBRight .h7 .h73 a:hover {
	background: #ffd7d7;
}

.briefIntroc, .catalog {
	width: 970px;
}

.title, .content {
	font-size: 14px;
}

.title {
	border-bottom: 2px solid #e5e5e5;
}

.title span {
	border-left: 2px solid #ff2832;
	font-family: "Microsoft Yahei";
	color: #323232;
	background: #e5e5e5;
	padding: 2px 5px;
}

.content {
	color: #656565;
	line-height: 22px;
	padding: 14px 20px;
}

.floor {
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.floor .user {
	font-size: 16px;
}

.floor .saytime {
	font-size: 10px;
}

.floor .saycontent {
	font-size: 14px;
	line-height: 28px;
}
</style>
<script>
	function changeNum(variable) {
		var num = document.getElementsByClassName('num')[0];
		var temp = parseInt(num.value) + variable;
		if (temp >= 1)
			num.value = parseInt(num.value) + variable;
	}
	

	function checknull(){
		var search=document.getElementById('search').value;
		if(search==null||search==""){
			alert("不能输入为空！");
			return false;
		}
	}
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
						width="900">
						<s:property value="#session.notification.notice" />
					</marquee></span> <span class="tTop2">欢迎光临网上书店， <%
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
				<form method="post" action="searchBookAction" onsubmit="return checknull()">
					<input type="text" placeholder="可根据书名作者或者类别进行模糊查询" id="search" class="info"
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
		<!--   位置导航-->
		<div class="where">
			<font class="font3">图书</font><font class="font1"> > <s:property
					value="#session.book.bookVariety.varietyName" /> >
			</font><font class="font2"><s:property value="#session.book.bookName" /></font>
		</div>
		<div class="bookBox">
			<div class="bBLeft">
				<img src="<s:property value="#session.book.cover" />" />
			</div>
			<div class="bBRight">
				<div class="h1">
					<s:property value="#session.book.bookName" />
				</div>
				<div class="h2">
					<s:property value="#session.book.description" />
				</div>
				<div class="h3 font1">
					<span>作者:<font class="font4"><s:property
								value="#session.book.authorName" /></font> 著
					</span><span>出版社:<font class="font4"><s:property
								value="#session.book.publisher" /></font></span><span>出版时间：<s:date
							name="#session.book.publishDate" format="yyyy/MM/dd" /></span>
				</div>
				<div class="h4">
					<span class="h41">¥<font class="h411"><s:property
								value="#session.book.price" /></font></span><span class="h42"></span>
				</div>
				<div class="h5">
					<span>ISBN:<s:property value="#session.book.isbn" /></span>
				</div>
				<div class="h6">
					<span>销量：<s:property value="#session.book.sellNum" /></span><span>点赞数：<s:property
							value="#session.book.likeNum" /></span>
				</div>
				<div class="h7">
					<div class="h72">
						<a
							href="addShoppingCart?bookid=<s:property value="#session.book.bookID" />">加入购物车</a>
					</div>
					<div class="h73">
						<a
							href="buyNow?bookid=<s:property value="#session.book.bookID" />">立即购买</a>
					</div>
					<div class="h73">
						<a
							href="preview?bookid=<s:property value="#session.book.bookID" />">预览</a>
					</div>
				</div>
			</div>
		</div>
		<div class="briefIntroc">
			<div class="title">
				<span>内容简介</span>
			</div>
			<div class="content">
				<s:property value="#session.book.description" />
			</div>
		</div>
		<div class="catalog">
			<div class="title">
				<span>评论广场</span>
			</div>
			<div class="content">
				<s:iterator value="#session.book.commentRecord">
					<div class="floor">
						<div class="user">
							<s:property value="user.phone" />
						</div>
						<div class="saytime">
							<s:date name="commentDate" format="yy/MM/dd hh:mm:ss" />
						</div>
						<div class="saycontent">
							<s:property value="bookComment" />
						</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
