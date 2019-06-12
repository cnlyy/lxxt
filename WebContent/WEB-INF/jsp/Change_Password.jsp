<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>修改密码</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/Change_Password.css">
<style type="text/css"></style>
<script type="text/javascript">
	function checkPass() {
		var psd1 = document.getElementById("newPass1").value;
		var psd2 = document.getElementById("newPass2").value;
		if (psd1 != psd2) {
			alert("密码不一致，请重新输入！");
			return false;
		}
		return true;
	}
</script>
</head>

<body style="margin: 0 0 0 0;">
	<div
		style="width: 100%; height: auto; background: #222222; z-index: 1; position: absolute;">

		<!--********************************-->
		<div style="margin-top: 70px;">
			<div class="bg bg-blur"></div>
			<div class="content content-front" style="margin-top: -75px;">
				<div
					style="width: 1010px; height: 70px; background: #222222; margin: 0 auto;">
					<div
						style="width: 85%; height: 70px; background: #222222; margin: 0 auto; float: left;">
						<div class="logo">
							<a href="${pageContext.request.contextPath }/toIndex.action"> <img src="images/logo4.gif" width="100"
								alt="漓享学堂">
							</a>
						</div>
						<div class="text">
							<ul>
								<li><a
									href="${pageContext.request.contextPath }/toIndex.action">
										<em>首页</em>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath }/PR_page.action">
										<em>PR</em>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath }/PS_page.action">
										<em>PS</em>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath }/GongXiang_page.action">
										<em>资源共享</em>
								</a></li>
								<%-- <li><a
									href="${pageContext.request.contextPath }/ZaZheng_page.action">
										<em>疑难杂症</em>
								</a></li> --%>
								<li><a
									href="${pageContext.request.contextPath }/See_XuQiu_page.action">
										<em>需求发布</em>
								</a></li>
								<li><a
									href="${pageContext.request.contextPath }/ZhiBo.action"> <em>在线直播</em>
								</a></li>
							</ul>
						</div>
					</div>

					<!--下拉菜单和头像-->
					<div style="float: right; padding-right: 10px; padding-top: 23px;">
						<div class="touxiang">
							<img src="images/user.png" class="img_touxiang">
						</div>
						<div class="dropdown">
							<button class="dropbtn">${USER_SESSION.username}</button>
							<div class="dropdown-content">
								<a href="${pageContext.request.contextPath }/My_release.action?publisher=${USER_SESSION.username}">
									我的发布</a> <a
									href="${pageContext.request.contextPath }/Change_Password.action">修改密码</a>
								<a href="${pageContext.request.contextPath }/logout.action">退出登录</a>
							</div>
						</div>
					</div>
				</div>
				<form action="changePass.action" method="post">

					<div class="box">
						<div style="height: 20px; background: #3FABE7;"></div>
						<div class="aa">
							<p class="pp">原&nbsp;&nbsp;密&nbsp;&nbsp;码：</p>
							<input required="required"  class="input" type="password" name="password" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18"  />
						</div>
						<div class="aa">
							<p class="pp">&nbsp;&nbsp;问&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;：</p>
							<input required="required"  class="input" type="text" name="problem"  maxlength="15"  />
						</div>
						<div class="aa">
							<p class="pp">&nbsp;&nbsp;答&nbsp;&nbsp;案&nbsp;&nbsp;&nbsp;：</p>
							<input required="required"  class="input" type="text" name="answer"  maxlength="15"  />
						</div>
						<div class="aa">
							<p class="pp">新&nbsp;&nbsp;密&nbsp;&nbsp;码：</p>
							<input required="required"  class="input" type="password" name="newPass" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18" id="newPass1" />
						</div>
						<div class="aa">
							<p class="pp">确认密码&nbsp;：</p>
							<input required="required"  class="input" type="password" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')" maxlength="18" id="newPass2"/>
						</div>
						<div style="height: 20px; background: #3FABE7;"></div>
						<div>
							<p style="color: #FF0004; font-size: 15px">
								<!-- 修改密码失败，请检查原密码、问题或答案是否正确！ -->
								${msg }
							</p>
							<p style="color: #FF0004; font-size: 15px">
								<!-- 两次输入的密码不一致！ -->
							</p>
						</div>
						<div>
							<!-- <button class="but">提交</button> -->
							<input value="提交" class="but" type="submit" onclick="return checkPass()" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
