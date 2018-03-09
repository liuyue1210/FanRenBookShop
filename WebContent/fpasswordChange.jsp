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
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<link rel="stylesheet" type="text/css" href="style/userManage.css" />
<style>
.medium .right {
	height: 430px;
}

.medium .right p {
	color: red;
	margin-top: 100px;
	margin-left: 30px;
}

.medium .right .note {
	font-size: 12px;
	color: red;
	margin-left: 8px;
}

.medium .right table {
	font-size: 14px;
	margin-top: 20px;
	margin-left: 30px;
}

.medium .right table tr {
	height: 45px;
}

.medium .right table tbody input {
	width: 150px;
	height: 25px;
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 2px 5px;
}

.medium .right table tfoot input {
	padding: 5px 20px;
	border-radius: 3px;
	border: 1px solid #ccc;
}
</style>
<script>
	window.onload = function() {

	}

	function check() {
		var password = document.getElementsByName("password")[0].value;
		var newpassword = document.getElementsByName("newpassword")[0].value;
		var newpassword1 = document.getElementsByName("newpassword1")[0].value;
		if (password == "") {
			alert("密码不能为空！");
			return false;
		} else if (newpassword == "") {
			alert("新密码不能为空！");
			return false;
		} else if (newpassword1 == "") {
			alert("新密码不能为空！");
			return false;
		} else if (newpassword != newpassword1) {
			alert("新密码不相等！");
			return false;
		} else if (newpassword.length < 6) {
			alert("密码大于6位！");
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
				<li><a href="fpasswordChange.jsp" class="on">密码修改</a></li>
				<li><a href="showBookShelf">书架管理</a></li>
			</ul>
		</div>
		<div class="right">
			<p>请输入原始密码以及修改密码以完成密码的修改</p>
			<form method="post" action="changePassword" onSubmit="return check()">
				<table>
					<tbody>
						<tr>
							<td>原密码：</td>
							<td><input type="password" name="password" /></td>
						<tr>
							<td>新密码：</td>
							<td><input type="password" name="newpassword" /></td>
						</tr>
						<tr>
							<td>再次输入新密码：</td>
							<td><input type="password" name="newpassword1" /></td>
						</tr>
					<tfoot>
						<tr align="center">
							<td colspan="2"><input type="submit" value="确认修改" /></td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
