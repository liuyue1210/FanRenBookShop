<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结算页面</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<script type="text/javascript" src="js/base.js"></script>
<%@ page
	import="com.ssh.shop.po.User,com.opensymphony.xwork2.ActionContext"%>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

.top {
	border-bottom: 3px solid #ff2832;
}

.tTop {
	width: 100%;
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

/*购物车非空*/
.medium table {
	font-size: 12px;
	font-family: "Microsoft Yahei", "Hiragino Sans GB", "Simsun", "Arial";
	margin-top: 20px;
	border-collapse: collapse;
	color: #969696;
	text-align: center;
	margin-left: 230px;
}

.medium table tbody, .medium table tbody tr {
	border: 1px solid #ccc;
}

.medium table tbody tr {
	height: 170px;
}

.medium table a {
	text-decoration: none;
	color: #323232;
}

.medium table a:hover {
	color: #ff2832;
	text-decoration: underline;
}

.medium table thead {
	line-height: 36px;
}

.medium table .all, .medium table .choice {
	float: left;
	width: 14px;
	height: 14px;
}

.medium table thead .all {
	margin-top: 12px;
}

.medium table tbody .choice {
	margin-left: 20px;
}

.medium table tbody img {
	width: 80px;
	height: 80px;
}

.medium table tbody span {
	display: block;
	width: 89px;
	margin-left: 55px;
}

.medium table tbody .change {
	display: block;
	float: left;
	width: 26px;
	height: 26px;
	text-align: center;
	background: #f4f4f4;
	border: 1px solid #ccc;
	line-height: 26px;
	font-size: 14px;
}

.medium table tbody .change:hover {
	text-decoration: none;
	background: #fff5f5;
}

.medium table tbody .num {
	width: 33px;
	height: 26px;
	border: 1px solid #ccc;
	border-left: none;
	border-right: none;
	line-height: 26px;
	text-align: center;
	color: #000;
	font-size: 14px;
	float: left;
	font-weight: bold;
}

.medium table tfoot {
	height: 72px;
	line-height: 72px;
}

.medium table tfoot .all {
	margin-top: 30px;
}

.medium table tfoot .price {
	font-size: 18px;
	color: #ff2832;
	margin-left: 5px;
}

.medium table tfoot .button {
	display: block;
	width: 116px;
	height: 38px;
	background: #f00;
	color: #fff;
	font: bold 18px/38px "Microsoft Yahei";
	text-align: center;
	float: right;
	border-radius: 2px;
	margin-top: 17px;
	margin-left: 20px;
	text-decoration: none;
}

.medium table tfoot .buttonDis {
	display: block;
	width: 116px;
	height: 38px;
	background: #e1e1e1;
	color: #fff;
	font: bold 18px/38px "Microsoft Yahei";
	text-align: center;
	float: right;
	border-radius: 2px;
	margin-top: 17px;
	margin-left: 20px;
	text-decoration: none;
}

/*购物车为空*/
.medium .left {
	width: 520px;
	height: 350px;
	float: left;
}

.medium .left img {
	margin-top: 30px;
	margin-left: 50px;
}

.medium .right {
	width: 440px;
	height: 350px;
	float: left;
	font-size: 12px;
	color: #969696;
}

.medium .right p {
	font-size: 14px;
	color: #8a8888;
	margin-top: 90px;
	margin-bottom: 20px;
}

.medium .right a {
	text-decoration: none;
	color: #000;
}

.medium .right a:hover {
	text-decoration: underline;
}

.medium .right .button2 {
	display: inline-block;
	width: 116px;
	height: 38px;
	background: #ff2832;
	line-height: 38px;
	font-size: 18px;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	margin-right: 20px;
}

.medium .right .button2:hover {
	background: #d21f2b;
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
<script type="text/javascript">
function payForBuyNow(bookID){
	var pwd=prompt("请输入支付密码");
	if(null!=pwd){
		var params = {
		        "bookid":bookID,
		        "pwd":pwd
		    };
		 httpPost("payForBuyNow", params);
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
	<!--网页中部，显示购物车内容-->
	<div class="medium">
		<table cellspacing="0" width="680">
			<thead>
				<tr>
					<td width="100">&nbsp;</td>
					<td width="250" align="left">商品信息</td>
					<td width="200">单价（元）</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 封面图片 -->
					<td><a
						href="findBookDetailAction?bookID=<s:property value="bookBuyed.bookID"/>"><img
							src="<s:property value="bookBuyed.cover"/>"
							alt="<s:property
									value="bookBuyed.bookName" />" /></a></td>
					<!-- 书名 -->
					<td align="left"><a
						href="findBookDetailAction?bookID=<s:property value="bookBuyed.bookID"/>"
						title="<s:property
									value="bookBuyed.bookName" />"><s:property
								value="bookBuyed.bookName" /></a></td>
					<!-- 价格 -->
					<td><s:property value="bookBuyed.price" /></td>
				</tr>
			</tbody>
			<tfoot>
				<!-- 结算 -->
				<tr>
					<td colspan="3" align="right">总计(不含折扣)：<span class="price"><s:property
								value="bookBuyed.price" /></span><a href="javascript:void;"
						onclick="payForBuyNow(<s:property
									value="bookBuyed.bookID" />)"
						class="button">结算</a></td>
			</tfoot>
		</table>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
