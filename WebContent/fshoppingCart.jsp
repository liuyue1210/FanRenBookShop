<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page
	import="com.ssh.shop.po.User,com.opensymphony.xwork2.ActionContext"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
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

#pwd {
	display: none;
}
</style>
<script type="text/javascript" src="js/base.js"></script>
<script>
	function deleteBook(id){
		if(confirm("你确定要删除该图书吗？")){
				location.href="deleteBook?id="+id;
		}
	}
	function batchDeleteBook(){
		if(confirm("你确定要批量删除图书吗？")){
			form.action="batchDeleteBook";
			form.submit();
		}
	}
	function payManyBooks(){
		if(confirm("你确定要购买图书吗？")){
			var pwd=prompt("请输入支付密码");
			if(null!=pwd){
				var pwdValue=document.getElementById('pwd').getElementsByTagName('input')[0];
				pwdValue.value=pwd;
				form.action="payManyBooks";
				form.submit();
			}
		}
	}
	function show(){
		//显示价格和选择数量
		var totalPrice=0;
		var selectedNum=0;
		var trs=document.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
		for(var i=0;i<trs.length;i++){
			var choice = trs[i].getElementsByClassName('choice')[0];
			if(choice.checked==true){
				var iter=trs[i].getElementsByTagName('td')[3];
				var price=parseFloat(iter.innerHTML);
				totalPrice+=price;
				selectedNum++;
			}
		}
		document.getElementsByTagName('tfoot')[0].getElementsByTagName('font')[0].innerHTML=selectedNum;
		document.getElementsByTagName('tfoot')[0].getElementsByClassName('price')[0].innerHTML='¥'+totalPrice;
	}
	
 	window.onload = function() {
		//页面加载时执行
		show();
		//全部选择
		var alls = document.getElementsByClassName('all');
		var choices = document.getElementsByClassName('choice');
		for (var i = 0; i < alls.length; i++) {
			alls[i].i = i;
			alls[i].onclick = function() {
				var j = this.i == 0 ? 1 : 0;
				if (this.checked == true) {
					alls[j].checked = true;
					for (var i = 0; i < choices.length; i++)
						choices[i].checked = true;
				} else {
					alls[j].checked = false;
					for (var i = 0; i < choices.length; i++)
						choices[i].checked = false;
				}
				show();
			}
		}
		//选择某一项
		for (var i = 0; i < choices.length; i++) {
			choices[i].onclick = function() {
				show();
			}
		}
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
	<!--网页中部，显示购物车内容-->
	<div class="medium">
		<form name="form" method="post">
			<table cellspacing="0" width="960">
				<thead>
					<tr>
						<td width="60"><input type="checkbox" class="all"
							checked="checked" />全选</td>
						<td width="100">&nbsp;</td>
						<td width="250" align="left">商品信息</td>
						<td width="200">单价（元）</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="shoppingCartDetails">
						<tr>
							<!-- 选择框 -->
							<td><input type="checkbox" name="choice" class="choice"
								checked="checked"
								value="<s:property
								value="sCdetailID" />" /></td>
							<!-- 封面图片 -->
							<td><a
								href="findBookDetailAction?bookID=<s:property value="book.bookID"/>"><img
									src="<s:property value="book.cover" />"
									alt="<s:property
										value="book.bookName" />" /></a></td>
							<!-- 书名 -->
							<td align="left"><a
								href="findBookDetailAction?bookID=<s:property value="book.bookID"/>"
								title="<s:property
									value="book.bookName" />"><s:property
										value="book.bookName" /></a></td>
							<!-- 价格 -->
							<td><s:property value="book.price" /></td>
							<!-- 删除 -->
							<td><a href="javascript:void(0);"
								onclick="deleteBook(<s:property
								value="sCdetailID" />)"
								class="delete">删除</a></td>
						</tr>
					</s:iterator>
				</tbody>
				<tfoot>
					<tr>
						<td><input type="checkbox" class="all" checked="checked" />全选</td>
						<td><a href="javascript:void;" class="delete"
							onclick="batchDeleteBook()">批量删除</a></td>
						<td>已选择<font color="red"></font>件商品
						</td>
						<td colspan="2" align="right">总计(不含折扣)：<span class="price"></span><a
							href="javascript:void;" class="button" onclick="payManyBooks()">结算</a></td>
				</tfoot>
			</table>
			<div id="pwd">
				<input name="pwd" type="password" />
			</div>
		</form>
		<!--    <div class="left"><img src="image/shoppingCartEmpty.JPG" /></div>
    <div class="right">
    	<p>您的购物车还是空的，您可以：</p>
    	<a href="#" class="button2">立即登录</a>登录后购物车的商品将保存到您的账号中，或者<a href="#">去逛逛</a>
    </div> -->
	</div>
	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
