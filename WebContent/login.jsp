<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="style/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
	function check() {
		var username = document.getElementById("username");
		var password = document.getElementById("pwd");
		if (username.value == "") {
			alert("用户名不能为空！");
			return false;
		} else if (password.value == "") {
			alert("密码不能为空！");
			return false;
		} else if (password.value.length < 6) {
			alert("密码大于6位！");
			return false;
		}
	}
</script>
</head>
<body>
	<div class="main">
		<div class="login-form">
			<h1>用户登录</h1>
			<div class="head">
				<img src="image/user.png" alt="" />
			</div>
			<form action="login" method="post" onSubmit="return check()">
				<input type="text" class="text" id="username" name="loginUser.userName" placeholder="请输入用户名" /> 
				<input type="password" id="pwd" name="loginUser.userPassword" placeholder="请输入密码" />
				<div class="submit">
					<input type="submit" value="登录">
				</div>
			</form>
		</div>
		<div class="copy-right">
			<p>版权@2018。凡人有限公司名称保留所有权利。</p>
		</div>
	</div>
</body>
</html>