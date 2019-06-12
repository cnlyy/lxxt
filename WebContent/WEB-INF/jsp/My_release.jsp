<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>我的发布</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/My_release.css">
</head>

<body style="background-color: antiquewhite">
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
							style="height: 35px; float: right; padding-right: 30px; padding-top: 23px;">
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
		<div style="width: 80%; margin: 0 auto;">
			<div class="problem_box_1">
				<!--问题一box-->
				<!--*******************************************-->
				<!--***************问题一***********************-->
				<!--********************************************-->
				<!--************需求一***************-->

				<c:forEach items="${pagemsg.lists}" var="u">
					<div class="news">
						<div class="news_title">
							<!--标题-->
							<p class="p_news_title">${u.title }</p>
						</div>
						<!--==================================-->
						<div class="user_news">
							<!--用户信息-->
							<div class="user_source">
								<p class="p_user_source" style="font-size: 20px;">发布者</p>
							</div>
							<div class="user_img">
								<img class="user_img_img" src="images/user.png">
							</div>
							<div class="user_name">
								<p style="font-size: 20px;">${u.publisher }</p>
							</div>
						</div>
						<div style="height: 3px; background: #FFFFFF;"></div>
						<!--==================================-->
						<div class="describe">
							<!--描述-->
							<p class="p_float1">描述：</p>
							<p class="p_float2">${u.descr }</p>
						</div>
						<div style="height: 3px; background: #FFFFFF;"></div>
						<!--==================================-->
						<div class="limit_time">
							<!--限时-->
							<p class="p_float3">限时：</p>
							<p class="p_float4">${u.begintime }至${u.endtime }</p>
						</div>
						<div style="height: 3px; background: #FFFFFF;"></div>
						<!--==================================-->
						<div style="width: 100%; height: auto;">
							<!--j接单-->
							<div style="padding-left: 30px;">


								<div style="width: 400px;">
									<a href="showAccept.action?taskid=${u.id } "> <input
										type="button" value="查看帮助人信息"
										style="width: 120px; height: 30px; font-size: 14px;" />
									</a>
									<p style="font-size: 16px; float: right; padding-top: 5px;">已有${u.accept }人提供帮助</p>
								</div>

							</div>
							<!-- 原本这里有个接单了的人的信息 ，被我拿出来注释掉了 这里是个标记提醒自己-->
							<div style="height: 5px; background: #78A4B1;"></div>
						</div>
					</div>
				</c:forEach>

				<!-- <table>
							<tr>
								<td style="text-align: center;"><p>个人特长</p></td>
								<td style="text-align: center;"><p>他的称呼</p></td>
								<td style="text-align: center;"><p>联系方式</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
							<tr style="text-align: center;">
								<td><p>奥术大师打算大所多阿阿斯顿啊实打啊</p></td>
								<td><p>陈先生</p></td>
								<td><p>12345678900</p></td>
							</tr>
						</table> -->

				<%-- <c:forEach items="${pagemsg.lists}" var="u">
					<tr class="tr_link">
						<td class="link1"><p class="p_link1">${u.name }</p></td>
						<td class="link2"><p class="p_link2">${u.link }</p></td>
						<td class="link3"><p class="p_link3">${u.uploader }</p></td>
					</tr>
				</c:forEach> --%>

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

				<%-- <table border="0" cellspacing="0" cellpadding="0" width="900px">
					<tr>

						<td class="td2"><span>第${pagemsg.currPage }/
								${pagemsg.totalPage}页</span> <span>总记录数：${requestScope.pagemsg.totalCount }
								每页显示:${pagemsg.pageSize}</span> <span> <c:if
									test="${pagemsg.currPage != 1}">
									<a
										href="${pageContext.request.contextPath }/GongXiang_page.action?currentPage=1">[首页]</a>
									<a
										href="${pageContext.request.contextPath }/GongXiang_page.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
								</c:if> <c:if
									test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
									<a
										href="${pageContext.request.contextPath }/GongXiang_page.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
									<a
										href="${pageContext.request.contextPath }/GongXiang_page.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
								</c:if>
						</span></td>
					</tr>
				</table> --%>

				<div style="width: 100%; height: 25px;"></div>
			</div>
		</div>
	</div>
</body>
</html>
