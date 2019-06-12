<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>疑难杂症</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet"
	href="css/ZaZheng_page_details.css">
</head>

<body style="background-color: antiquewhite">
	<!--********************************************-->
	<div class="details">
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
			<div class="user_">
				<div style="width: 100%; height: 10px;"></div>
				<div class="details_title">
					<!--**********标题***********-->
					<p class="p_details_title">标题</p>
					<div class="user_information">
						<div class="user_name">
							<img class="user_name_img" src="images/comment_nam.png">
							<p class="p_user_name">name</p>
						</div>
						<div class="user_time">
							<img class="user_time_img" src="images/comment_time_img.png">
							<p class="p_user_time">time</p>
						</div>
					</div>
				</div>
				<div class="problem_details">
					<p class="p_problem_details">12341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123123412312312312341231231231234123123123</p>
				</div>
				<div class="user_img">
					<img class="images" src="images/other.jpg">
				</div>
			</div>

			<!--=============我的评论=============-->
			<div class="comment">
				<div class="my_comment">
					<textarea class="input_my_comment"
						placeholder="请自觉遵守互联网相关的政策法规,严禁发布色情、暴力、反动的言论。"></textarea>
				</div>
				<button class="publish">发表评论</button>
			</div>

			<!--=============游客评论=============-->
			<div class="people_comment">
				<table class="comment_box">
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
					<tr class="comment_1">
						<td class="comment_text"><p class="p_comment_text">游客评论
								游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论 游客评论
							</p></td>
						<td class="comment_time">
							<p class="p_comment_time">评论时间</p>
						</td>
					</tr>
				</table>
				<div style="width: 100%; height: 20px;">-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------</div>
				<!-- ------------??----------->
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
				<div style="width: 100%; height: 15px;"></div>


			</div>
		</div>
</body>
</html>
