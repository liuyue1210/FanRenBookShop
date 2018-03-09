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
<title>书架管理</title>
<!-- 2018.1.10郑佳颖改 class="medium" -->
<!-- 添加左边的链接 -->
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<link rel="stylesheet" type="text/css" href="style/userManage.css" />
<script type="text/javascript" src="js/base.js"></script>
<style>
.medium .right {
	height: 400px;
	padding: 10px 30px;
}

.bookshelf {
	height: 340px;
	overflow: hidden;
}

.abook a {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	color: #333;
}

.abook a:hover {
	color: #f00;
	text-decoration: underline;
}

.medium .right .abook {
	width: 147px;
	float: left;
	margin: 10px;
	border: 1px solid #ccc;
	padding: 5px;
}

.medium .right .abook img {
	width: 110px;
	height: 120px;
}

.page {
	margin-top: 10px;
}
</style>
<script>
	function comment(book_id) {
		var comment = prompt("输入您的评价");
		if (comment != null) {
			location.href = 'addComment?book_id=' + book_id + '&comment=' + comment;
		}
	}

	function like(book_id) {
		location.href = 'addLike?book_id=' + book_id;
	}
	function downloadBook(book_id){
		var params = {
		        "bookid":book_id
		    };
		 httpPost("downloadBook", params);
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
	<!--网页中部，账号管理（个人信息、密码修改、书架管理）-->
	<div class="medium">
		<div class="left">
			<ul>
				<li><a href="fpersonInfo.jsp">个人信息</a></li>
				<li><a href="fpasswordChange.jsp">密码修改</a></li>
				<li><a href="showBookShelf" class="on">书架管理</a></li>
			</ul>
		</div>
		<div class="right">
			<div class="bookshelf">
				<s:iterator value="#session.user.books">
					<div class="abook">
						<center>
							<div>
								<img src="<s:property value="cover"/>" />
							</div>
							<div>
								<span> <a href="javascript:void(0)"
									onclick="comment(<s:property value="bookID"/>)">评论</a>
								</span> <span><a href="javascript:void(0)"
									onclick="like(<s:property value="bookID"/>)">点赞</a> </span> <span>
									<a href="javascript:void(0)"
									onclick="downloadBook(<s:property value="bookID"/>)">下载</a>
								</span>
							</div>
						</center>
					</div>
				</s:iterator>
			</div>

		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
