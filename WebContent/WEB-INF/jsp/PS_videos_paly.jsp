<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>PR_videos</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/PR_videos.css">
</head>

<body>
	<!--==================================================-->

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
									<li><a
										href="${pageContext.request.contextPath }/PR_page.action">
											<em>PR</em>
									</a></li>
									<li class="active"><a
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
		<div class="video_big_box">
			<!--最大-->
			<div class="video_box">
				<!--外层box-->
				<div class="video">
					<!--装视频-->
					<video class="video_play" controls="controls"> <source
						src="${pageContext.request.contextPath }/videos/${PSVIDEO.psvideo_route }" type="video/mp4"></video>
						<!-- src="C:\\Users\\administer\\Desktop\\ds.mp4" type="video/mp4"></video> -->
				</div>
				<div class="jianjie">
					<!--右侧-->

					<div class="video_name">
						<!--上-->
						<div class="name_box1">
							<!--名称-->
							<p class="p_name_box1">名称</p>
						</div>
						<div class="name_box2">
							<!--xxx-->
							<p class="p_name_box2">${PSVIDEO.psvideo_name }</p>
						</div>
					</div>
					<!--*********************************-->
					<div class="video_jianjie">
						<!--下-->
						<div class="jianjie_box1">
							<!--简介-->
							<p class="p_jianjie_box1">简介</p>
						</div>
						<div class="jianjie_box2">
							<!--xxxxxxx-->
							<p class="p_jianjie_box2">${PSVIDEO.psvideo_introduce }</p>
						</div>
					</div>
					<div
						style="width: 100%; margin-top: 5px; text-align: center; background: #908C7A;">
						<a href="${pageContext.request.contextPath }/toUpload_video_ps.action" target="view_window">
							<button class="btu_upload">上传视频</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
