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
<title>凡人书店首页</title>
<link rel="stylesheet" type="text/css" href="style/frontBase.css" />
<style>
.medium {
	height: 600px;
}

.medium .mLeft2 {
	width: 184px;
	height: 598px;
	float: left;
	border: 1px solid #487a6f;
	border-radius: 4px 4px 0 0;
}

.mLeft2 div {
	height: 35px;
	background: #487a6f;
	color: #fff;
	text-align: center;
	line-height: 35px;
}

.mLeft2 ul {
	text-indent: 50px;
	list-style: none;
	padding-left: 10px;
	padding-right: 10px;
}

.mLeft2 ul li a {
	width: 164px;
	height: 28px;
	display: block;
	font-size: 14px;
	line-height: 28px;
	text-decoration: none;
	color: #487a6f;
	font-weight: bold;
	border-bottom: 1px dotted #487a6f;
}

.mLeft2 ul li a:hover {
	border-bottom: 1px solid #487a6f;
	color: #F63;
}

.medium .mMedium {
	width: 754px;
	height: 600px;
	float: left;
	padding-left: 10px;
	padding-right: 10px;
}

.mMedium div {
	border-bottom: 2px solid #487a6f;
	height: 34px;
	line-height: 34px;
	color: #487a6f;
	font-weight: bold;
}

.mMedium dl {
	width: 148px;
	height: 242px;
	float: left;
	padding: 20px;
}

.mMedium dl dt img {
	width: 148px;
	height: 180px;
}

.mMedium dl dd {
	height: 62px;
}

.mMedium dl dd span {
	display: block;
}

.mMedium .s1 a {
	font-size: 12px;
	color: #000;
	text-decoration: none;
}

.mMedium .s2 {
	height: 24px;
	line-height: 24px;
	color: #aaa;
	font-size: 12px;
}

.mMedium .s3 {
	color: #c30;
	font-weight: bold;
	font-size: 14px;
}

.mMedium .s3 del {
	margin-left: 10px;
	font-weight: normal;
	color: #aaa;
}

.mMedium .s1 .ahover, .mMedium .s1 a:hover {
	color: #ec7814;
	text-decoration: underline;
}

.medium .mRight {
	width: 240px;
	height: 600px;
	float: right;
}

.mRight .ti {
	height: 34px;
	color: #d72832;
	font-size: 16px;
	font-weight: bold;
	line-height: 34px;
	text-indent: 32px;
	background: url(image/prize.png) no-repeat 2px center;
}

.mRight .ti2 {
	height: 25px;
	color: #487a6f;
	font-size: 14px;
	line-height: 25px;
	font-weight: bold;
	text-indent: 10px;
	width: 238px;
	border-top: 1px solid #d8d8d8;
	border-right: 1px solid #d8d8d8;
	border-left: 1px solid #d8d8d8;
	border-bottom: 1px dotted #d8d8d8;
	text-decoration: underline;
}

.mRight ul {
	width: 220px;
	height: 519px;
	border: 1px solid #d8d8d8;
	padding: 9px;
	list-style: none;
	text-indent: 10px;
	font-size: 12px;
}

.mRight ul .lastnon .bar1 {
	height: 35px;
	line-height: 35px;
	border-bottom: 1px dotted #d8d8d8;
	width: 220px;
	word-break: break-all;
	word-wrap: break-word;
	overflow: hidden;
}

.rank {
	font-size: 14px;
	font-weight: 500;
	display: inline-block;
	width: 27px;
	height: 35px;
}

.mRight ul .lastnon .bookName {
	margin-left: 7px;
}

#test {
	display: none;
}

.mRight ul .lastnon .bar2 {
	width: 220px;
	height: 175px;
	border-bottom: 1px dotted #d8d8d8;
}

.bar2 .rank {
	margin-top: 3px;
}

.bar2 img {
	vertical-align: top;
	margin-left: 7px;
	margin-top: 15px;
	width: 90px;
	height: 128px;
}

.bar2 {
	position: relative;
}

.bar2 .bookName2 {
	display: block;
	width: 70px;
	height: 50px;
	position: absolute;
	top: 25px;
	left: 145px;
	text-indent: 0;
	overflow: hidden
}

.bar2 .bookName2 a {
	text-decoration: none;
	color: #000;
}

.bar2 .bookName2 a:hover, .bar2 .bookName2 .ahover {
	text-decoration: underline;
	color: #ec7814;
}

.bar2 .price, .bar2 .price2 {
	display: block;
	width: 70px;
	height: 20px;
	position: absolute;
	left: 145px;
	text-indent: 0;
	font-size: 14px;
}

.bar2 .price {
	top: 80px;
	font-weight: bold;
	color: #c30;
}

.bar2 .price2 {
	top: 100px;
	font-weight: normal;
	color: #aaa;
}

.mRight .lastnon .bar2 {
	display: none;
}

.mRight .liOn .bar1 {
	display: none;
}

.mRight .liOn .bar2 {
	display: block;
}

.page {
	height: 40px;
	text-align: center;
	width: 980px;
	clear: both;
	margin-top: 35px;
}

.page .button {
	background: #fa5000;
	color: #fff;
	height: 30px;
	width: 70px;
	line-height: 30px;
	font-size: 14px;
	font-family: "Microsoft YaHei";
	border: none;
}

.page .button:hover {
	background: #fa2f00;
}

.page .text {
	width: 50px;
	height: 28px;
	text-align: center;
}

.page span {
	font-family: Arial;
	font-size: 12px;
	margin: 0 10px;
}

.page span font {
	color: #f60;
	font-weight: bold;
}

#ol{
	display:none;
}
</style>
<script>
function testOnload(){
	var ol=document.getElementById('ol');
	if(!ol.innerHTML){
		location.href="showMainAction";
	}
}

	window.onload = function() {
		testOnload();
		//老板推荐
		var dts = document.getElementsByClassName('mMedium')[0]
				.getElementsByTagName('dt');
		for (var i = 0; i < dts.length; i++) {
			//字体状态改变
			dts[i].onmouseover = function() {
				var dl = this.parentNode;
				var a = dl.getElementsByTagName('dd')[0]
						.getElementsByTagName('a')[0];
				a.className = 'ahover';
			}
			dts[i].onmouseout = function() {
				var dl = this.parentNode;
				var a = dl.getElementsByTagName('dd')[0]
						.getElementsByTagName('a')[0];
				a.className = '';
			}
		}
		//图书畅销榜
		var lastnons = document.getElementsByClassName('lastnon');
		for (var i = 0; i < lastnons.length; i++) {
			//手风琴效果
			lastnons[i].onmouseover = function() {
				var liOn = document.getElementsByClassName('liOn')[0];
				liOn.className = 'lastnon';
				this.className = 'lastnon liOn';
			}
			//字体状态改变
			var a2 = lastnons[i].getElementsByClassName('bar2')[0]
					.getElementsByTagName('a')[0];
			a2.onmouseover = function() {
				var a3 = this.parentNode.parentNode
						.getElementsByClassName('bookName2')[0]
						.getElementsByTagName('a')[0];
				a3.className = 'ahover';
			}
			a2.onmouseout = function() {
				var a3 = this.parentNode.parentNode
						.getElementsByClassName('bookName2')[0]
						.getElementsByTagName('a')[0];
				a3.className = '';
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
<div id="ol">${request.count }</div>
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
				<a href="fmain.jsp">首页</a> <span class="tTop1">
				<marquee width="900">
				<s:property value="#session.notification.notice" />
				</marquee>
				</span> <span class="tTop2">欢迎光临网上书店，
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

	<!--网页中部、可变（全部图书分类不变），此处含有图书分类、新书上架及畅销榜-->
	<div class="medium">
		<!--全部图书分类-->
		<!--<div class="mLeft1">
    	<ul>
            <li><a href="#">历史</a></li>
            <li><a href="#">历史</a></li>
            <li><a href="#">历史</a></li>
            <li><a href="#">历史</a></li>
        </ul>
    </div>-->
		<!-- 图书分类-->
		<div class="mLeft2">
			<div>图书分类</div>
			<s:iterator value="#session.BVList">
				<ul>
					<li><a
						href="searchVoBAction?variety=<s:property value="varietyID" />&&varietyName=<s:property value="varietyName" />"><s:property
								value="varietyName" /></a></li>
				</ul>
			</s:iterator>
		</div>
		<!--  新书上架-->
		<div class="mMedium">
			<div>老板推荐</div>
			<s:iterator value="mainPageBean.list">
				<ul>
					<li>
						<dl>
							<dt>
								<a
									href="findBookDetailAction?bookID=<s:property value="bookID"/>"><img
									src="<s:property value="cover"/>"
									title="<s:property value="bookName"/>"
									alt="<s:property value="authorName"/>" /></a>
							</dt>
							<dd>
								<span class="s1"><a
									href="findBookDetailAction?bookID=<s:property value="bookID"/>"
									title="<s:property value="publisher"/>"><s:property
											value="bookName" /></a></span> <span class="s2"><s:property
										value="authorName" /></span> <span class="s3">¥<s:property
										value="price" /></span>
							</dd>
						</dl>

					</li>
				</ul>
			</s:iterator>
		</div>
		<!--    图书畅销榜-->
		<div class="mRight">
			<div class="ti">图书畅销榜</div>
			<div class="ti2">总榜</div>

			<ul>
				<!-- 这里要做判断，如果是销量排行第一的图书，那么就默认显示书名和封面，其他图书只显示书名，
         只有在鼠标悬停在该书上时才会去显示图书的封面 -->
				<s:iterator value="bookSelledList" status="st">
					<s:if test="#st.first">
						<li class="lastnon liOn"><p class="bar1">
								<span class="rank"><s:property value="#st.index+1" /></span><span
									class="bookName"><s:property value="bookName" /></span>
							</p>
							<dl class="bar2">
								<dt>
									<span class="rank"><s:property value="#st.index+1" /></span> <a
										href="findBookDetailAction?bookID=<s:property value="bookID"/>"><img
										src="<s:property value="cover"/>"
										title="<s:property value="bookName"/>"
										alt="<s:property value="bookName"/>" /></a>
								</dt>
								<dd>
									<span class="bookName2"><a
										href="findBookDetailAction?bookID=<s:property value="bookID"/>"
										title="<s:property value="bookName"/>"><s:property
												value="authorName" /></a></span> <span class="price">¥<s:property
											value="price" /></span> <span class="price2"><del>¥39.80</del></span>
								</dd>
							</dl></li>
					</s:if>

					<s:else>
						<li class="lastnon"><p class="bar1">
								<span class="rank"><s:property value="#st.index+1" /></span><span
									class="bookName"><s:property value="bookName" /></span>
							</p>
							<dl class="bar2">
								<dt>
									<span class="rank"><s:property value="#st.index+1" /></span> <a
										href="findBookDetailAction?bookID=<s:property value="bookID"/>"><img
										src="<s:property value="cover"/>"
										title="<s:property value="bookName"/>"
										alt="<s:property value="bookName"/>" /></a>
								</dt>
								<dd>
									<span class="bookName2"><a
										href="findBookDetailAction?bookID=<s:property value="bookID"/>"
										title="<s:property value="bookName"/>"><s:property
												value="authorName" /></a></span> <span class="price">¥<s:property
											value="price" /></span> <span class="price2"><del>¥39.80</del></span>
								</dd>
							</dl></li>
					</s:else>
				</s:iterator>
			</ul>

		</div>
	</div>
	<center>
		<div class="page">
			<s:if test="%{mainPageBean.currentPage > 1}">
				<input type="button" value="第一页" class="button"
					onclick="javascript:window.location.href='showMainAction?mainPage=1' " />
				<input type="button" value="上一页" class="button"
					onclick="javascript:window.location.href='showMainAction?mainPage=<s:property value="%{mainPageBean.currentPage-1}"/>' " />
			</s:if>

			<span>当前第 <s:property value="mainPageBean.currentPage" /> 页
			</span> <span>共 <s:property value="mainPageBean.totalPage" />页
			</span> <span>共 <s:property value="mainPageBean.allRow" />条记录
			</span>

			<s:if test="%{mainPageBean.currentPage != mainPageBean.totalPage}">
				<input type="button" value="下一页" class="button"
					onclick="javascript:window.location.href='showMainAction?mainPage=<s:property value="%{mainPageBean.currentPage+1}"/>' " />
				<input type="button" value="最后一页" class="button"
					onclick="javascript:window.location.href='showMainAction?mainPage=<s:property value="mainPageBean.totalPage"/>' " />
			</s:if>

			<!-- 有空再实现选择性页面跳转 -->
			<!-- <input type="button" value="下一页" class="button" /> <span>到第</span> <input
			type="text" class="text" value="8" /> <span>页</span> <input
			type="button" value="确定" class="button" /> -->
		</div>
	</center>

	<!--网页底部，常用-->
	<div class="bottom">©凡人有限公司</div>
</body>
</html>
