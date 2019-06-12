<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<!-- <link type="text/css" rel="stylesheet" href="css/Register_page.css"> -->
<script type="text/javascript">
	function toLogin() {
		document.forms.form2.action = "toLogin.action";
		document.forms.form2.submit();
	}
</script>
<style type="text/css">
.login{
	width: 100%;
	height: 933px;
	margin: 0;
	text-align: center;
	/* background: url(../images/Login.jpg); */
	background: url(${pageContext.request.contextPath}/images/Wheel_planting/Change_Password_BG2.jpg);
	position:relative;
}

.login_box{
	width: 500px;
	height: 400px;
	margin: auto;
	position: absolute;  
	top: 0; 
	left: 0; 
	bottom: 0; 
	right: 0; 
	border-radius:8px;
	background: #4E4A4A;
	opacity:0.90;/*半透明*/
}

.title{
	width: 100%;
	height: 30px;
}
.p_title{
	font-size: 28px;
	font-family: "黑体";
	line-height: 30px;
}

.username{
	width: 100%;
	height: auto;
}

.input_username_password{
	width: 55%;
	height: 35px;
	margin-bottom: 5px;
	font-size: 15px;
	font-family: "songti";
	border-radius: 3px;
	border:0.5px solid #378888;
}

.password{
	width: 100%;
	height: auto;
}

.security_question{
	color: beige;
}

.secret_answer{
	margin-top: 5px;
}
.p_secret_answer{
	color: beige;
}
.input_secret_answer{
	width: 180px;
	height: 27px;
	padding-left: 5px;
	border: 1px #cfcfcf solid;
	border-radius:3px;				/*设置圆角*/
	-webkit-border-radius:3px;
	-moz-border-radius :3px;
}


.btn{					/*按钮区*/
	width: 55%;
	height: 35px;
	margin: 0 auto;
	margin-top: 10px;
}

.login_button{
	width: 38%;
	float: left;
	height: 35px;
	font-size: 16px;
	font-family: "黑体";
	border-radius:5px;
	border:1px #000000 solid;
}

.release_button{
	width: 38%;
	float: right;
	height: 35px;
	font-size: 16px;
	font-family: "黑体";
	border-radius:5px;
	border:1px #000000 solid;
}


</style>
</head>

<body style="margin: 0px auto;">
	<form id="form2" action="${pageContext.request.contextPath }/register.action" method="post">
		<div class="login">
			<!--最大-->
			<div class="login_box">
				<!--中间框-->
				<div class="title">
					<!--欢迎登录-->
					<p class="p_title">欢迎使用漓享学堂</p>
					<div class="username">
						<!--账号-->
						<input class="input_username_password" placeholder=" 请输入用户名"
							name="username"   required="required" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="11">
					</div>
					<div class="password">
						<!--密码-->
						<input class="input_username_password" placeholder=" 请输入密码"
							name="password" type="password"  required="required" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18">
					</div>
					<div class="password">
						<!--密码-->
						<input class="input_username_password" placeholder=" 请再次输入密码"
							type="password"  required="required" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18">
					</div>
					<div class="secret_answer">
						<label class="p_secret_answer">密保问题：</label> 
						<input
							class="input_secret_answer"  required="required" placeholder="建议15个字以内" name="problem" maxlength="15">
					</div>
					<div class="secret_answer">
						<label class="p_secret_answer">密保答案：</label> <input
							class="input_secret_answer"  required="required" placeholder="建议15个字以内" name="answer" maxlength="15">
					</div>
					<div>
						<p style="color: red;">${msg}</p>
					</div>



					<div class="btn">
						<!--登录、注册按钮-->

						<!-- <button class="login_button" onclick="toLogin()" type="button">登录</button> -->

						<button class="release_button" type="submit">注册</button>
					</div>
				</div>
				<!---->
			</div>
		</div>
	</form>
</body>
</html>
