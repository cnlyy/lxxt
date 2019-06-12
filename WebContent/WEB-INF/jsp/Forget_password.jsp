<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<%-- <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/caidan.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Forget_password.css"> --%>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/Change_Password.css">
<style type="text/css"></style>
</head>

<body style="margin: 0 0 0 0;">
	<div
		style="width: 100%; height: auto; background: #222222; z-index: 1; position: absolute;">

		<!--********************************-->
		<div style="margin-top: 0px;">
			<div class="bg bg-blur"></div>
			<div class="content content-front" style="margin-top: 0px;">
				<form action="findPass.action" method="post">

					<div class="box">
						<div style="height: 20px; background: #3FABE7;"></div>
						<div class="aa">
							<p class="pp">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</p>
							<input class="input" name="username"
								onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"
								required="required" maxlength="11">
						</div>
						<div class="aa">
							<p class="pp">&nbsp;&nbsp;问&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;：</p>
							<input class="input" name="problem" type="password"
								quired="required" maxlength="15">
						</div>
						<div class="aa">
							<p class="pp">&nbsp;&nbsp;答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;：</p>
							<input class="input" name="answer" type="password"
								required="required" maxlength="15">
						</div>
						<div style="height: 20px; background: #3FABE7;"></div>
						<div>
							<!-- 显示的时候二选一-->
							<!-- <p style="color: #FF0004;font-size: 15px">找回密码失败，请检查用户名、问题或答案是否正确！</p>
          <p style="color: #FF0004;font-size: 15px">您的原密码为：xxx</p> -->
							<p style="color: #FF0004; font-size: 15px">${msg }</p>


						</div>
						<div>
							<button class="but" type="submit">提交</button>
						</div>
						<div></div>
						<div></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
