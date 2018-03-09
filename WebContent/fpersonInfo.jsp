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
<title>个人信息</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<link rel="stylesheet" type="text/css" href="style/userManage.css" />
<script type="text/javascript" src="js/base.js"></script>
<style>
.medium .right p {
	margin: 20px 5px;
}

.medium .right p .item {
	font-size: 16px;
	font-weight: 500;
	margin-right: 5px;
}

.medium .right p .value {
	font-size: 14px;
	font-weight: 300;
}
</style>
<script>
	window.onload = function() {
		var change = document.getElementById('change');
		var save = document.getElementById('save');
		var recharge = document.getElementById('recharge');
		//修改
		var canChanges = document.getElementsByClassName('canChange');
		change.onclick = function() {
			if (change.innerHTML == '修改') {
				change.innerHTML = '取消';
				for (var i = 0; i < canChanges.length; i++) {
					var tmp = canChanges[i].innerHTML;
					canChanges[i].innerHTML = "<input type='text'></input>";
					canChanges[i].firstChild.value = tmp;
				}
			} else {
				for (var i = 0; i < canChanges.length; i++) {
					var tmp = canChanges[i].firstChild.value;
					canChanges[i].innerHTML = tmp;
				}
				change.innerHTML = '修改';
			}
		}
		//保存
		save.onclick = function() {

		}
		//充值
		recharge.onclick = function() {
			var money = prompt("充值金额");
			if (null != money && !isNaN(money) && money > 0) {
				var paypassword = prompt("请输入充值密码");
				if (null != paypassword) {
					alert('稍等...');
					var params = {
						"money" : money,
						"paypassword" : paypassword
					};
					httpPost("chargeBalance", params);
				}
			}
		}
	}
	function changeInfo() {
		var right = document.getElementsByClassName('medium')[0]
				.getElementsByClassName('right')[0];
		var canChanges = right.getElementsByTagName('input');
		var sex = canChanges[0].value;
		//	alert('sex=' + sex);
		var phone = canChanges[1].value;
		var email = canChanges[2].value;
		var userName = alert('sex=' + sex + '\nphone=' + phone + '\nemail='
				+ email);
		location.href = 'userupdate?user.sex=' + sex + '&user.phone=' + phone
				+ '&user.email=' + email;
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
				<li><a href="fpersonInfo.jsp" class="on">个人信息</a></li>
				<li><a href="fpasswordChange.jsp">密码修改</a></li>
				<li><a href="showBookShelf">书架管理</a></li>
			</ul>
		</div>
		<div class="right">
			<p>
				<span class="item">昵称：</span><span>${user.userName}</span><span><a
					href="#" class="button" id="change">修改</a></span>
			</p>
			<p>
				<span class="item">性别：</span><span class="value canChange">${user.sex}</span><span><a
					href="javascript:changeInfo()" class="button" id="save">保存</a></span>
			</p>
			<p>
				<span class="item">手机：</span><span class="value canChange">${user.phone}</span>
			</p>
			<p>
				<span class="item">邮箱：</span><span class="value canChange">${user.email}</span>
			</p>
			<p>
				<span class="item">余额：</span><span class="value">${user.balance}</span><span><a
					href="#" class="button" id="recharge">充值</a></span>
			</p>

		</div>
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
