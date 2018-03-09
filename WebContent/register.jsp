<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link href="style/restyle.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
	
	
	
	
	
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
	}, false); 
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	}
	
	function isphone(s) {
		var reg = new RegExp("^13[0-9]{1}[0-9]{8}|^15[0-9]{1}[0-9]{8}");
		if (reg.test(s)) {
			return true;
		} else
			return false;
	}

	function check(){
		var username = document.getElementById("username");
		var password = document.getElementById("pwd");
		var sex = document.getElementById("sex");
		var phone = document.getElementById("phone");
		var email = document.getElementById("email");
		var paypwd = document.getElementById("paypwd");
		if (username.value == ""){
			alert("用户名不能为空！");
			return false;
		} else if (password.value.length < 6){
			alert("密码必须大于等于6位！");
			return false;
		}  else if (phone.value.length != 11){
			alert("手机号码为11位！");
			return false;
		} else if (sex.value != "男" && sex.value != "女"){
			alert("性别必须填男或女！");
			return false;
		} else if (!isphone(phone.value)) {
			alert("非法的电话号码！");
			return false;
		} else if (email.value.indexOf("@") == -1){
			alert("邮件中需要包含@！");
			return false;
		} else if (paypwd.value.length < 6){
			alert("支付密码必须大于等于6位！");
			return false;
		} else if (paypwd.value == pwd.value){
			alert("支付密码不能与用户登录密码相同！");
			return false;
		}
	}






</script>
<link
	href='http://fonts.googleapis.com/css?family=Lobster|Pacifico:400,700,300|Roboto:400,100,100italic,300,300italic,400italic,500italic,500'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,500,600,700,300'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!--start-login-form-->
	<div class="main">
		<div class="login-head">
			<h1>Register</h1>
		</div>
		<div class="wrap">
			<div class="Regisration">
				<div class="Regisration-head">
					<h2>
						<span></span>Register
					</h2>
				</div>
				<form action="register" method="post" onSubmit="return check()">
					<input type="text" id="username" name="loginUser.userName"
						placeholder="请输入用户名"> <input type="password" id="pwd"
						name="loginUser.userPassword" placeholder="请输入密码"> <input
						type="text" id="sex" name="loginUser.sex" placeholder="请输入性别,男/女">
					<input type="text" id="phone" name="loginUser.phone"
						placeholder="请输入电话"> <input type="text" id="email"
						name="loginUser.email" placeholder="请输入邮箱"> <input
						type="password" id="paypwd" name="loginUser.payPassword"
						placeholder="请输入支付密码">
					<div class="submit">
						<input type="submit" value="注册">
					</div>
				</form>
			</div>
		</div>
		<!--//End-login-form-->
		<div class="copy-right">
			<p>Template by 凡人有限公司</p>
		</div>
	</div>
</body>
</html>