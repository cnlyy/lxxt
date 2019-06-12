<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>资源共享</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet"
	href="css/Backstage_All_user_page.css">

<style type="text/css">
.td2 {
	text-align: right;
}
</style>
</head>

<body>
	<!--***********************************************************-->

	<!--****************************我有资源***********-->
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
									<li class="active"><a
										href="${pageContext.request.contextPath }/allUser.action">
											<em>所有用户</em>
									</a></li>
									<li><a
										href="${pageContext.request.contextPath }/Backstage_GongXiang_page.action">
											<em>资源共享</em>
									</a></li>
								<%-- 	<li><a
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

		<!--*****************************-->
		<div class="all_link_box">
			<table border="1"
				style="width: 80%;margin:0 auto; text-align: center; margin-top: 10px;">
				<tr>
					<th>用户名</th>
					<th>密码</th>
					<th>问题</th>
					<th>答案</th>
					<th>积分</th>
					<th>管理</th>
				</tr>
				<c:forEach items="${pagemsg.lists}" var="u">
					<tr>
						<td>${u.username }</td>
						<td>${u.password}</td>
						<td>${u.problem }</td>
						<td>${u.answer }</td>
						<td>${u.integral}</td>
						<th><a href="deleteUser.action?username=${u.username }"><button>删除</button></a></th>
					</tr>
				</c:forEach>
			</table>
			<div style="width: 100%; height: 40px;"></div>


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
			<table border="0" cellspacing="0" cellpadding="0" width="900px">
				<tr>

					<td class="td2"><span>第${pagemsg.currPage }/
							${pagemsg.totalPage}页</span> <span>总记录数：${requestScope.pagemsg.totalCount }
							每页显示:${pagemsg.pageSize}</span> <span> <c:if
								test="${pagemsg.currPage != 1}">
								<a
									href="${pageContext.request.contextPath }/allUser.action?currentPage=1">[首页]</a>
								<a
									href="${pageContext.request.contextPath }/allUser.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
							</c:if> <c:if
								test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
								<a
									href="${pageContext.request.contextPath }/allUser.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
								<a
									href="${pageContext.request.contextPath }/allUser.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
							</c:if>
					</span></td>
				</tr>
			</table>
			<div style="width: 100%; height: 25px;"></div>
		</div>
	</div>
</body>
</html>