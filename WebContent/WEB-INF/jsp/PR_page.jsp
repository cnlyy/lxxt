<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>PR</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<!-- <link type="text/css" rel="stylesheet" href="css/PR_page.css"> -->
<link type="text/css" rel="stylesheet" href="css/PR_page_test.css">
<style type="text/css">
.td2 {
	text-align: right;
}
</style>

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
									<li class="active"><a href="#"> <em>PR</em>
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
		<!--******************************************************************-->



		<div class="">
			<div style="width: 1525px; margin: 0 auto; margin-top: 10px;">
				<!--============96==========%-->

				<div>
					<div
						style="width: 1525px; height: 1150px;; margin: 0 auto; text-align: center;">
						<!--=====================================================-->
						<c:forEach items="${pagemsg.lists}" var="u">
							<div class="b_c">
								<div class="videos_img">
									<!--装视频图片-->
									<img style="border-radius: 10px;" src="images/vdicon.jpg">
								</div>
								<div class="video_name">
									<!--装视频标题-->
									<p class="p_video_name">
										<%-- <a
											href="toPR_videos_paly.action?name=${u. prvideo_name }&introduce=${u.prvideo_introduce }&route=${u.prvideo_route }"
											class="link_name">${u. prvideo_name}</a> --%>
										<a href="toPR_videos_paly.action?id=${u.id }"
											class="link_name">${u. prvideo_name}</a>
									</p>
								</div>
								<div class="video_explain_box">
									<!--装视频说明-->
									<p class="p_video_explain">${u.prvideo_introduce }</p>
								</div>
							</div>
						</c:forEach>
					</div>
					<div
						style="width: 400px; height: 35px; margin: 0 auto; text-align: center; line-height: 35px; margin-bottom: 30px; float: left;">
						<div style="margin: 0 auto;">
							<table border="0" cellspacing="0" cellpadding="0" width="900px">
								<tr>

									<td class="td2"><span>第${pagemsg.currPage }/
											${pagemsg.totalPage}页</span> <span>总记录数：${requestScope.pagemsg.totalCount }
											每页显示:${pagemsg.pageSize}</span> <span> <c:if
												test="${pagemsg.currPage != 1}">
												<a
													href="${pageContext.request.contextPath }/PR_page.action?currentPage=1">[首页]</a>
												<a
													href="${pageContext.request.contextPath }/PR_page.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
											</c:if> <c:if
												test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
												<a
													href="${pageContext.request.contextPath }/PR_page.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
												<a
													href="${pageContext.request.contextPath }/PR_page.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
											</c:if>
									</span></td>
								</tr>
							</table>
						</div>
					</div>
				</div>


				<div style="width: 100%; height: 20px;"></div>

				<!-- ------------分页----------->
				<!-- <div class="fenye_box">
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
				</div> -->

			</div>
		</div>




	</div>
</body>
</html>
