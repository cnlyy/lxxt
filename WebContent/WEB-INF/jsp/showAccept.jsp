<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帮助人信息</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/PR_videos.css">
<style>
.height_1 {
	height: 40px;
}

.height_2 {
	height: 30px;
}

.title_font_size {
	font-size: 18px;
}

.news_font_size {
	font-size: 16px;
}
</style>
</head>
<body style="background: #1F1F1F;">
	<div style="width: 60%;text-align: center;margin: 0 auto;margin-top: 30px;background: #8C8C8C;">

		<table width="100%" border="1">
			<tr class="height_1">
				<td class="title_font_size">个人特长</td>
				<td class="title_font_size">他的称呼</td>
				<td class="title_font_size">联系方式</td>
			</tr>
			<c:forEach items="${pagemsg.lists}" var="u">
				<tr class="height_2">
					<td><p>${u.skill }</p></td>
					<td><p>${u.nickname }</p></td>
					<td><p>${u.wechat }</p></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>