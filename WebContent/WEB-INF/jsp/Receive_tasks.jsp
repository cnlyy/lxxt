<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>PR</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/PR_page.css">
<style>
a {
	color: black;
}

a:hover {
	color: red
}
</style>
</head>

<body>
	<div>
		<div style="width: 100%; height: 70px; background: #222222;">
			<div
				style="width: 980px; height: 100%; background: #222222; margin: 0 auto;">
				<div style="width: 980px; height: 100%; background: #222222;">
					<div>
						<!--主菜单-->
						<div
							style="width: 85%; height: 70px; background: #222222; margin: 0 auto; float: left;">
							<div class="logo">
								<a href="${pageContext.request.contextPath }/toIndex.action"> <img src="images/logo4.gif"
									width="100" alt="漓享学堂">
								</a>
							</div>
							<div class="text">
								<ul>
									<li><a
										href="${pageContext.request.contextPath }/toIndex.action">
											<em>首页</em>
									</a></li>
									<li><a href="#"> <em>PR</em>
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
									<a href="${pageContext.request.contextPath }/My_release.action?publisher=${USER_SESSION.username}">
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
		<!--******************************************************************-->
		<div style="width: 100%;height: 857px;background: #FEFBE8;">
		<div style="width: 100%; height: auto;">
			<div
				style="width: 1200px; height: 657px; background: #969696; margin: 0 auto; margin-top: 5px;">
				<div
					style="width: 100%; height: 50px; background: #2E2E2E; margin: 0 auto; text-align: center;">
					<p style="font-size: 20px; line-height: 50px">${TASK.title }</p>
				</div>
				<div style="width: auto; height: 50px;">
					<p
						style="float: left; padding-left: 10px; font-size: 18px; line-height: 50px;">发布者</p>
					<p
						style="float: left; padding-left: 10px; font-size: 16px; line-height: 50px;">${TASK.publisher}</p>
				</div>
				<div style="height: 3px;background: #FFFFFF;"></div>
				<div>
					<p style="font-size: 18px; padding-left: 10px;">描述：</p>
					<p
						style="font-size: 16px; padding-left: 10px; padding-right: 10px; text-indent: 2em;">${TASK.descr }
					</p>
				</div>
				<div style="height: 3px;background: #FFFFFF;"></div>
				<div style="width: auto; height: 30px; padding-bottom: 30px;">
					<p
						style="font-size: 18px; padding-left: 10px; float: left; padding-top: 5px; line-height: 30px;">限时：</p>
					<p
						style="font-size: 16px; padding-left: 10px; padding-right: 10px; padding-top: 5px; text-indent: 2em; line-height: 30px;">${TASK.begintime }
						至 ${TASK.endtime }</p>
				</div>
				<div style="height: 3px;background: #FFFFFF;"></div>
				<form action="taskAccept.action" method="post">
					<div
						style="width: 500px; height: 300px; background: #0ECFC0; margin: 0 auto;">
						<p
							style="height: 30px; line-height: 30px; background: #298866; font-size: 18px; text-align: center;">申请接任务</p>
						<div style="height: 50px;"></div>
						<div
							style="height: 30px; padding-left: 5px; padding-top: 5px; padding-bottom: 5px;">
							<p style="float: left; font-size: 16px; line-height: 30px;">个人特长：</p>
							<input style="width: 80%; height: 30px;" placeholder="例如：AE粒子特效" name="skill" />
						</div>
						<div
							style="height: 30px; padding-left: 5px; padding-top: 5px; padding-bottom: 5px;">
							<p style="float: left; font-size: 16px; line-height: 30px;">您的称呼：</p>
							<input style="width: 80%; height: 30px;"
								placeholder="填写您的名字或者xx先生" name="nickname" />
						</div>
						<div
							style="height: 30px; padding-left: 5px; padding-top: 5px; padding-bottom: 5px;">
							<p style="float: left; font-size: 16px; line-height: 30px;">联系方式：</p>
							<input style="width: 80%; height: 30px;" placeholder="填写您的微信号" name="wechat"/>
						</div>
						<div style="padding-top: 5px; padding-left: 200px;">
							<button style="width: 90px; height: 30px; font-size: 16px;" type="submit">提交申请</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>
