<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>资源共享</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/ZhiBo.css">
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
									<li class="active"><a href="ZhiBo.action"> <em>在线直播</em>
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
		<form action="shareLive.action" method="post">
			<div class="share_box">
			<div class="title">
				<p class="p_title">直播教程</p>
			</div>
			<div class="link_type">
				<p class="p_link_type">类型</p>
				<input class="link_type_input" placeholder=" 例如：PR无缝转场" name="name"  required="required" maxlength="20" />
			</div>
			<div class="_link">
				<p class="p_link">链接</p>
				<input class="link_input" placeholder=" 例如：www.xxxxx.com" name="link" required="required">
			</div>
			<div class="btn">
				<button class="btn_button"
					onmouseover="this.style.backgroundColor='#E4D6D3';"
					onmouseout="this.style.backgroundColor='';" type="submit">分 享</button>
			</div>
		</div>
		
		</form>
		<!--*****************************-->
		<div class="all_link_box">
			<table class="all_link_title">
				<tr class="title_type">
					<td class="all_link_type"><p class="p_title_type">资源名称</p></td>
					<td class="all_link"><p class="p_title_type">链接</p></td>
					<td class="link_man"><p class="p_title_type">发表者</p></td>
				</tr>
				
				<c:forEach items="${pagemsg.lists}" var="u">
					<tr class="tr_link">
						<td class="link1"><p class="p_link1">${u.name }</p></td>
						<td class="link2"><p class="p_link2">${u.link }</p></td>
						<td class="link3"><p class="p_link3">${u.uploader }</p></td>
					</tr>
				</c:forEach>
				
				<!-- <tr class="tr_link">
					<td class="link1"><p class="p_link1">ppt模板</p></td>
					<td class="link2" style=""><p class="p_link2">www.111.com</p></td>
					<td class="link3"><p class="p_link3">name1</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">PR镜头慢放</p></td>
					<td class="link2"><p class="p_link2">www.222.com</p></td>
					<td class="link3"><p class="p_link3">name2</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.comwww.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr>
				<tr class="tr_link">
					<td class="link1"><p class="p_link1">AE片头</p></td>
					<td class="link2"><p class="p_link2">www.333.com</p></td>
					<td class="link3"><p class="p_link3">name3</p></td>
				</tr> -->
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
									href="${pageContext.request.contextPath }/ZhiBo.action?currentPage=1">[首页]</a>
								<a
									href="${pageContext.request.contextPath }/ZhiBo.action?currentPage=${pagemsg.currPage-1}">[上一页]</a>
							</c:if> <c:if
								test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
								<a
									href="${pageContext.request.contextPath }/ZhiBo.action?currentPage=${pagemsg.currPage+1}">[下一页]</a>
								<a
									href="${pageContext.request.contextPath }/ZhiBo.action?currentPage=${pagemsg.totalPage}">[尾页]</a>
							</c:if>
					</span></td>
				</tr>
			</table>
			
			<div style="width: 100%; height: 25px;"></div>
		</div>
	</div>
</body>
</html>
