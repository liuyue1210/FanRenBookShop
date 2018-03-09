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
<title>fanRenShuWu</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
a {
	text-decoration: none;
}

.medium .d1 {
	border-bottom: 2px solid #ff2328;
}

.medium .d1 span {
	display: block;
	height: 35px;
	width: 122px;
	line-height: 35px;
	text-align: center;
	font-size: 16px;
	font-family: "Microsoft YaHei";
	background: #ff2328;
	color: #fff;
}

.medium .where {
	background: #f5f5f5;
	font-size: 12px;
	padding: 6px 0 6px 20px;
	line-height: 32px;
	font-family: "Microsoft YaHei";
}

.medium .where a {
	color: #333;
}

.medium .where a:hover {
	color: #fa5000;
	text-decoration: underline;
}

.medium .where font {
	color: #fa5000;
}

.medium .category {
	font-size: 12px;
	margin-top: 3px;
	background: #fbf2ed;
	overflow: auto;
}

.medium .category .categoryLeft, .medium .category .categoryRight {
	float: left;
}

.medium .category .categoryLeft {
	width: 71px;
	padding-top: 9px;
	text-align: center;
	color: #999;
	font-family: Arial, "Hiragino Sans GB", "Simsun", sans-serif;
	border-bottom: 1px solid #eeeceb;
}

.medium .category .categoryRight {
	padding: 4px 2px 4px 35px;
	background: #fff;
	width: 1092px;
}

.medium .category .categoryRight span {
	display: inline-block;
	width: 125px;
	height: 22px;
	padding: 3px 10px 3px 0;
}

.medium .category .categoryRight span a {
	color: #333;
}

.medium .category .categoryRight span a:hover {
	color: #fa5000;
	text-decoration: underline;
}

.bookshow ul {
	list-style: none;
	height: 2420px;
}

.bookshow li {
	height: 242px;
	float: left;
}

.bookshow .bL {
	width: 242px;
	float: left;
}

.bookshow .bL img {
	width: 200px;
	height: 200px;
	margin: 21px;
}

.bookshow .bR {
	width: 738px;
	float: left;
	margin-top: 21px;
}

.bookshow a {
	text-decoration: none;
}

.bookshow .bR .h1 a {
	font-size: 14px;
	color: #1a66b3;
	font-family: simsun;
}

.bookshow .bR .h1 a:hover {
	text-decoration: underline;
	color: #fa5000;
}

.bookshow .bR .h2 {
	margin-top: 18px;
}

.bookshow .bR .h2 .h21 {
	font-size: 18px;
	color: #ff2832;
	font-family: arial, "Hiragino Sans GB", "Simsun";
	font-weight: bold;
}

.bookshow .bR .h2 .h22 {
	color: #969696;
	font-size: 12px;
	font-family: arial, "Hiragino Sans GB", "Simsun";
	margin-left: 15px;
}

.bookshow .bR .h3 {
	margin-top: 10px;
	font-size: 12px;
	color: #1a66b3;
	font-family: "Microsoft Yahei";
}

.bookshow .bR .h3 .h31 {
	color: #787878;
	font-family: arial, "Hiragino Sans GB", "Simsun";
}

.bookshow .bR .h4 {
	margin-top: 22px;
	color: #333;
	line-height: 20px;
	font-size: 14px;
	width: 738px;
	height: 40px;
	overflow: hidden;
}

.bookshow .bR .h5 {
	margin-top: 30px;
}

.bookshow .bR .h5 a {
	display: block;
	background: #fa2f00;
	width: 100px;
	height: 28px;
	line-height: 28px;
	color: #fff;
	text-align: center;
	font-family: "Microsoft Yahei";
	font-size: 14px;
	border-radius: 3px;
}

.bookshow .bR .h5 a:hover {
	background: #f00000;
}

.bookshow li:hover {
	background: #f8f8f8;
}

.bookshow .page {
	height: 40px;
	text-align: center;
	width: 980px;
	clear: both;
	margin-top: 35px;
}

.bookshow .page .button {
	background: #fa5000;
	color: #fff;
	height: 30px;
	width: 70px;
	line-height: 30px;
	font-size: 14px;
	font-family: "Microsoft YaHei";
	border: none;
}

.bookshow .page .button:hover {
	background: #fa2f00;
}

.bookshow .page .text {
	width: 50px;
	height: 28px;
	text-align: center;
}

.bookshow .page span {
	font-family: Arial;
	font-size: 12px;
	margin: 0 10px;
}

.bookshow .page span font {
	color: #f60;
	font-weight: bold;
}

.sortList {
	font-size: 12px;
	font-family: "Microsoft YaHei";
}

.sortList ul {
	list-style: none;
}

.sortList ul li {
	float: left;
	height: 30px;
}

.sortList ul a {
	display: block;
	height: 20px;
	margin: 5px 0;
	padding: 0 10px;
	line-height: 20px;
	text-decoration: none;
	color: #333;
	border-right: 1px dotted #aaa;
}

.sortList ul li:hover, ul .on {
	background: #e6e6e6;
}

.sortList ul li:hover a, ul .on a {
	color: #fd5115;
}

.sortList ul .up, ul .down {
	padding: 0 20px 0 10px;
}

.sortList ul .up {
	background: url(image/up.png) no-repeat 85% center;
}

.sortList ul .down {
	background: url(image/down.png) no-repeat 85% center;
}

.sortList span {
	float: right;
	margin-right: 15px;
}

.sortList span .previous, span .next, span p {
	display: block;
	float: left;
}

.sortList span .previous, span .next {
	width: 18px;
	height: 18px;
	margin-top: 6px;
}

.sortList span span {
	line-height: 30px;
	margin: 0 5px;
	font-family: Arial;
}

.sortList span span font {
	color: #f60;
	font-weight: bold;
}

.sortList span .previous {
	background: url(image/previous.png) no-repeat center center #fd5115;
}

.sortList span .next {
	background: url(image/next.png) no-repeat center center #fd5115;
}

.medium .sortList {
	height: 30px;
	width: 1200px;
	margin-top: 18px;
	border: solid 1px #efefef;
	background: #f5f5f5;
}

.medium .bookshow {
	margin-top: 20px;
	width: 980px;
	height: 2842px;
	border: none;
}
</style>
<script type="text/javascript">

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
				<form method="post" action="searchBookAction" onsubmit="return checknull()">
					<input type="text" id="search" placeholder="可根据书名作者或者类别进行模糊查询" class="info"
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
		<!--全部图书分类-->
		<!-- <div class="mLeft1">
			<ul>
				<li><a href="#">历史</a></li>
				<li><a href="#">历史</a></li>
				<li><a href="#">历史</a></li>
				<li><a href="#">历史</a></li>
			</ul>
		</div> -->
		<div class="d1">
			<span>全部商品</span>
		</div>
		<!--   位置导航-->
		<div class="where">
			<a href="showMainAction">全部</a> >
			<s:property value="#session.varietyName" />
			共<font><s:property value="#session.searchPageBean.list.size" /></font>件商品
		</div>
		<!--图书分类-->
		<div class="category">
			<div class="categoryLeft">分类</div>
			<div class="categoryRight">
				<s:iterator value="#session.BVList">
					<span><a
						href="searchVoBAction?variety=<s:property value="varietyID" />"><s:property
								value="varietyName" /></a></span>
				</s:iterator>
			</div>
		</div>

		<!-- 排序方式-->
		<div class="sortList">
			<ul>
				<li class="on"><a href="sortBookAction?condition=initialSort"
					title="点击后恢复综合排序">综合排序</a></li>
				<li><a href="sortBookAction?condition=sellNumU"
					title="点击后销量由高到低" class="down">销量</a></li>
				<li><a href="sortBookAction?condition=sellNumD"
					title="点击后销量由低到高" class="up">销量</a></li>
				<li><a href="sortBookAction?condition=likeNumU"
					title="点击后点赞数由高到低" class="down">点赞数</a></li>
				<li><a href="sortBookAction?condition=likeNumD"
					title="点击后点赞数由低到高" class="up">点赞数</a></li>
				<li><a href="sortBookAction?condition=priceU" title="点击后价格由高到低"
					class="down">价格</a></li>
				<li><a href="sortBookAction?condition=priceD" title="点击后价格由低到高"
					class="up">价格</a></li>
			</ul>
		</div>
		<div class="bookshow">
			<ul>
				<s:iterator value="#session.searchPageBean.list">
					<li>
						<div class="bL">
							<a
								href="findBookDetailAction?bookID=<s:property value="bookID"/>"><img
								src="<s:property value="cover"/>"
								title="<s:property value="bookName"/>"
								alt="<s:property value="bookName"/>" /></a>
						</div>
						<div class="bR">
							<div class="h1">
								<a
									href="findBookDetailAction?bookID=<s:property value="bookID"/>"
									title="<s:property value="bookName"/>"><s:property
										value="bookName" /></a>
							</div>
							<div class="h2">
								<span class="h21">¥<s:property value="price" /></span><span
									class="h22">下载量：<s:property value="sellNum" /></span> <span
									class="h22"> 点赞量：<s:property value="likeNum" /></span>
							</div>
							<div class="h3">
								<span><s:property value="authorName" /></span><span class="h31">
									/<s:date name="publishDate" format="yyyy/MM/dd" />/
								</span><span><s:property value="publisher" /></span>
							</div>
							<div class="h4">
								<s:property value="description" />
							</div>
							<div class="h5">
								<a href="addShoppingCart?bookid=<s:property value="bookID" />">加入购物车</a>
							</div>
						</div>
					</li>
				</s:iterator>
			</ul>
			<center>
				<div class="page">
					<s:if test="%{#session.searchPageBean.currentPage > 1}">
						<input type="button" value="第一页" class="button"
							onclick="javascript:window.location.href='searchBookAction?searchPage=1' " />
						<input type="button" value="上一页" class="button"
							onclick="javascript:window.location.href='searchBookAction?searchPage=<s:property value="%{#session.searchPageBean.currentPage-1}"/>' " />
					</s:if>

					<span>当前第 <s:property
							value="#session.searchPageBean.currentPage" /> 页
					</span> <span>共 <s:property
							value="#session.searchPageBean.totalPage" /> 页
					</span> <span>共 <s:property value="#session.searchPageBean.allRow" />
						条记录
					</span>

					<s:if
						test="%{#session.searchPageBean.currentPage != #session.searchPageBean.totalPage}">
						<input type="button" value="下一页" class="button"
							onclick="javascript:window.location.href='searchBookAction?searchPage=<s:property value="%{#session.searchPageBean.currentPage+1}"/>' " />
						<input type="button" value="最后一页" class="button"
							onclick="javascript:window.location.href='searchBookAction?searchPage=<s:property value="#session.searchPageBean.totalPage"/>' " />
					</s:if>

					<!-- 有空再实现选择性页面跳转 -->
					<!-- <input type="button" value="下一页" class="button" /> <span>到第</span> <input
			type="text" class="text" value="8" /> <span>页</span> <input
			type="button" value="确定" class="button" /> -->
				</div>
			</center>
		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
