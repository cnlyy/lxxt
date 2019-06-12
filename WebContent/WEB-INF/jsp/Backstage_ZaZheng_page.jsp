<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>疑难杂症</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/ZaZheng.css">
</head>

<body style="background-color: antiquewhite">
	<!--********************************************-->
	<div class="ZaZheng">
		<!--big_box-->
		<!--++++++++++++菜单栏+++++++++++-->
		<div style="width: 100%;">
			<!--++++++++++++菜单栏+++++++++++-->
			<div style="width: 100%; height: 70px; background: #222222;">
				<div
					style="width: 980px; height: 100%; background: #222222; margin: 0 auto;">
					<div style="width: 980px; height: 100%; background: #222222;">
						<div>
							<!--主菜单-->
							<div
								style="width: 80%; height: 70px; background: #222222; margin: 0 auto; float: left;">
								<div class="logo">
									<a href="#"> <img src="images/logo4.gif" width="100"
										alt="漓享学堂">
									</a>
								</div>
								<div class="text">
									<ul>
										<li><a
											href="${pageContext.request.contextPath }/allUser.action">
												<em>所有用户</em>
										</a></li>
										<li><a
											href="${pageContext.request.contextPath }/Backstage_GongXiang_page.action">
												<em>资源共享</em>
										</a></li>
										<%-- <li class="active"><a
											href="${pageContext.request.contextPath }/Backstage_ZaZheng_page.action">
												<em>疑难杂症</em>
										</a></li> --%>
										<li><a
											href="${pageContext.request.contextPath }/Backstage_See_XuQiu_page.action">
												<em>需求发布</em>
										</a></li>
										<li><a
											href="${pageContext.request.contextPath }/Backstage_ZhiBo.action">
												<em>在线直播</em>
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
									<button class="dropbtn">${ADMIN_SESSION.username }</button>
									<div class="dropdown-content">
										<!-- <a href="Change_Password.html">修改密码</a> -->
										<a href="${pageContext.request.contextPath }/logout.action">退出登录</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="width: 80%; margin: 0 auto;">
				<div class="problem_box_1">
					<!--问题一box-->
					<!--*******************************************-->
					<!--***************问题一***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>

							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题二***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题三***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题四***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题五***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题六***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题七***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题八***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题九***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!--***************问题十***********************-->
					<div class="problem">
						<div class="problem_title">
							<p class="p_problem_title">
								<a href="ZaZheng_page_details.html" class="link_name">这是标题一</a>
							</p>
							<div class="user_information">
								<div class="user_name">
									<img class="user_name_img" src="images/comment_nam.png">
									<p class="p_user_name">user_name</p>
									<div style="padding-left: 100px; padding-top: 10px;">
										<button>删除</button>
									</div>
								</div>
								<div class="user_time">
									<img class="user_time_img" src="images/comment_time_img.png">
									<p class="p_user_time">user_time</p>
								</div>
							</div>
							<!--右边-->
						</div>
						<div class="problem_details">
							<p>&nbsp;</p>
							<p class="p_problem_details">这是问题详情这是问题详情这是问题详情这是问这是问题详情这是问题详情这是问题详情这是问题详情题详情这是问题详情这是问题详情这是问题详情这是问题详情</p>
						</div>
						<div class="problem_img">
							<img class="picture" src="images/picture.jpg">
						</div>
					</div>
					<!-- ------------分页----------->
					<div class="fenye_box">
						<ul class="pagination">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a class="active" href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">»</a></li>
						</ul>
					</div>
					<div style="width: 100%; height: 25px;"></div>
				</div>
			</div>
			<!--=============外层div=============-->
		</div>
</body>
</html>
