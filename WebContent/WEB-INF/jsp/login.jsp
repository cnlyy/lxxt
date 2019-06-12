<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/Login_page.css"> --%>
<script type="text/javascript">
	function toregister() {
		document.forms.form1.action = "toRegister.action";
		document.forms.form1.submit();
	}
</script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html {
	height: 100%;
}

body {
	height: 100%;
	/* background: #fff
		url(${pageContext.request.contextPath}/images/Login.jpg) 50% 50%
		no-repeat; */
		/* background: red; */
		/* background: url(${pageContext.request.contextPath}/images/Wheel_planting/Change_Password_BG2.jpg); */
		background: url(${pageContext.request.contextPath}/images/Wheel_planting/Change_Password_BG2.jpg);
	background-size: cover;
}

.dowebok {
	position: absolute;
	left: 50%;
	top: 50%;
	width: 430px;
	height: 450px;
	margin: -300px 0 0 -215px;
	border: 0px solid #fff;
	border-radius: 20px;
	overflow: hidden;
	background:#2E302F;
	opacity: 0.90; /*半透明*/
}

.logo {
	width: 100%;
	height: 50px;
	margin: 50px auto 10px;
	background: url(${pageContext.request.contextPath}/images/login.jpg) 0 0
		no-repeat;
}

.form-item {
	position: relative;
	width: 360px;
	margin: 0 auto;
	padding-bottom: 15px;
}

.form-item input {
	width: 315px;
	height: 48px;
	padding-left: 40px;
	border: 1px solid #fff;
	border-radius: 25px;
	font-size: 18px;
	color: #fff;
	background-color: transparent;
	outline: none;
}

.form-item button {
	width: 360px;
	height: 50px;
	border: 0;
	border-radius: 25px;
	font-size: 18px;
	color: #1f6f4a;
	outline: none;
	cursor: pointer;
	background-color: #fff;
}

#username {
	background: url(img/emil.png) 20px 14px no-repeat;
}

#password {
	background: url(img/password.png) 23px 11px no-repeat;
}

.tip {
	display: none;
	position: absolute;
	left: 20px;
	top: 52px;
	font-size: 14px;
	color: #f50;
}

.reg-bar {
	width: 360px;
	margin: 20px auto 0;
	font-size: 14px;
	overflow: hidden;
}

.reg-bar a {
	color: #fff;
	text-decoration: none;
}

.reg-bar a:hover {
	text-decoration: underline;
}

.reg-bar .reg {
	float: left;
}

.reg-bar .forget {
	float: right;
}

.dowebok ::-webkit-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok ::-moz-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

.dowebok :-ms-input-placeholder {
	font-size: 18px;
	line-height: 1.4;
	color: #fff;
}

@media screen and (max-width: 500px) {
	* {
		box-sizing: border-box;
	}
	.dowebok {
		position: static;
		width: auto;
		height: auto;
		margin: 0 30px;
		border: 0;
		border-radius: 0;
	}
	.logo {
		margin: 50px auto;
	}
	.form-item {
		width: auto;
	}
	.form-item input, .form-item button, .reg-bar {
		width: 100%;
	}
}
</style>
</head>

<body style="margin: 0 0 0 0;">
	<form id="form1"
		action="${pageContext.request.contextPath }/login.action"
		method="post">
		<div class="dowebok">
			<div class="logo">
				<p
					style="font-size: 32px; text-align: center; font-family: '黑体'; color: #E06F70;">欢迎登录漓享学堂</p>
			</div>
			<div class="form-item">
				<!-- 只能输入字母和数字，长度为 5（使用maxlength属性来控制长度） -->
				 <!-- <input onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="5" />  -->
				 <input id="username" name="username" type="text" autocomplete="off" placeholder="用户名"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" required="required" maxlength="11" >
			</div>
			<div class="form-item">
				<input id="password" name="password" type="password"
					autocomplete="off" placeholder="登录密码"  onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" required="required" maxlength="18" >
			</div>
			<div class="form-item">
				<input id="submit" type="submit" class="login_button" value="登录">
			</div>
			<div style="text-align: center;">
				<p style="color: #F00004; font-family: '黑体'; font-size: 20px;">${msg}</p>
			</div>
			<div class="reg-bar">
				<!-- <input class="reg" href="javascript:" value="注册" type="button" onclick="toregister()"/> -->
				
				<!-- ;javascript: -->
				<a class="reg"
					href="${pageContext.request.contextPath }/toRegister.action">注册</a>
				<a class="forget"
					href="${pageContext.request.contextPath }/Forget_password.action">忘记密码</a>
			</div>
		</div>
	</form>
</body>
</html>
