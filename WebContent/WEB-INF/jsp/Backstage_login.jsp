<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link type="text/css" rel="stylesheet" href="css/Backstage_login.css">
</head>

<body style="margin:0px auto;">
<div class="login"><!--最大-->
  <div class="login_box"><!--中间框-->
    <div class="title"><!--欢迎登录-->
      <p class="p_title">管理员登录</p>
      <div class="username"><!--账号-->
        <input class="input_username_password" placeholder=" 请输入用户名">
      </div>
      <div class="password"><!--密码-->
        <input class="input_username_password" placeholder=" 请输入密码">
      </div>
      <div class="other">
        <div class="tips">
          <p class="p_tips">登录失败，请确认账号或密码是否正确！</p>
        </div>
        <div class="forget_password">
          <p class="p_forget_password"><a href="Forget_password.html">忘记密码？</a></p>
        </div>
      </div>
      <div class="btn"><!--按钮--> 
        <a href="Backstage_GongXiang_page.html">
        	<button class="login_button">登录</button>
        </a>
		</div>
    </div>
    <!----> 
  </div>
</div>
</body>
</html>