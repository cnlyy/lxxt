<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>发布需求</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/Release_XuQiu_page.css">
<style>
ul {
	list-style: none outside none;
}
</style>
</head>

<body>
	<div style="width: 100%;">
		<!--++++++++++++菜单栏+++++++++++-->
		<div style="width: 100%; height: 70px; background: #222222;">
			<div
				style="width: 980px; height: 100%; background: #222222; margin: 0 auto;">
				<div style="width: 980px; height: 100%; background: #222222;">
					<div>
						<!--主菜单-->
						<div
							style="width: 85%; height: 70px; background: #222222; margin: 0 auto; float: left;">
							<div class="logo">
								<a href="${pageContext.request.contextPath }/toIndex.action">
									<img src="images/logo4.gif" width="100" alt="漓享学堂">
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
									<li class="active"><a
										href="${pageContext.request.contextPath }/See_XuQiu_page.action">
											<em>需求发布</em>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath }/ZhiBo.action"> <em>在线直播</em>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div>
						<!--下拉菜单-->
						<div
							style="height: 35px; float: right; padding-right: 10px; padding-top: 23px;">
							<div class="touxiang">
								<img src="images/user.png" class="img_touxiang">
							</div>
							<div class="dropdown">
								<button class="dropbtn">${USER_SESSION.username}</button>
								<div class="dropdown-content">
									<a
										href="${pageContext.request.contextPath }/My_release.action?publisher=${USER_SESSION.username}">
										我的发布</a> <a
										href="${pageContext.request.contextPath }/Change_Password.action">修改密码</a>
									<a href="${pageContext.request.contextPath }/logout.action">退出登录</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="width: auto; height: 10px;"></div>
		<div class="XuQiu">
			<div class="title">
				<ul>
					<a href="${pageContext.request.contextPath }/See_XuQiu_page.action">
						<li class="zhao">查看需求</li>
					</a>
					<li class="jie"><a href="#">发布需求</a></li>
				</ul>
			</div>
			<form action="insertNeed.action" method="post">

				<!--============================================================-->
				<div class="release">
					<div class="release_title">
						<p class="p_release_title">欢迎发布您的需求！</p>
					</div>
					<div class="introduce">
						<p class="p_introduce">介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介绍介2</p>
					</div>
					<!--=============================标题==-->
					<div class="release_name">
						<div style="width: 100%;">
							<p class="p_release_input">标题：</p>
							<input class="release_input" placeholder="例如：帮我做一个科技感的PPT模板"  required="required" maxlength="30" 
								name="title">
							<div></div>
						</div>
					</div>

					<!--===============================-->

					<div class="describe">
						<div style="width: 100%;">
							<p class="p_describe">描述：</p>
							<!--<input class="describe_input" placeholder="">-->
							<textarea class="describe_input"
								placeholder="11111
22222
33333" name="descr"></textarea>
						</div>
					</div>

					<!--===============================-->

					<div class="time">
						<div style="width: 100%;">
							<p class="p_time">限时</p>
							<div class="choice_time">
								<div class="choice_time1">
									<input class="input_time1" placeholder="例如：2018-12-25"
										name="begintime" required="required" maxlength="10" >
								</div>
								<div class="p_choice_time">至</div>
								<div class="choice_time2">
									<input class="input_time2" placeholder="例如：2018-12-31"
										name="endtime" required="required" maxlength="5" >
								</div>
							</div>
						</div>
					</div>
					<div class="tijiao">
						<li class="p_tijiao"><input value="发布需求" type="submit"
							style="width: 100%; height: 40px; border: none; background: transparent; font-family: '黑体'; font-size: 22px; color: aliceblue;" /></li>
					</div>
					<!--===============================-->
				</div>
			</form>
		</div>
	</div>
</body>
</html>
