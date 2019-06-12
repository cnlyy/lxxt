<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>上传PR视频</title>
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/upload_video.css">
<style type="text/css"></style>

<!-- 测试是否上传了文件 -->
<script type="text/javascript">
	function check() {
		var name = document.getElementById("name").value;
		var file = document.getElementById("file").value;
		if(name==""){
			alert("填写上传人");
			return false;
		}
		if(file.length==0||file==""){
			alert("请上传文件");
			return false;
		}
		return true;
	}
</script>

</head>

<body style="margin: 0 0 0 0;">
	<div
		style="width: 100%; height: auto; background: #222222; z-index: 1; position: absolute;">

		<!--********************************-->
		<div style="margin-top: 70px;">
			<div class="bg bg-blur"></div>
			<div class="content content-front" style="margin-top: -75px;">
				<div
					style="width: 1020px; height: 70px; background: #222222; margin: 0 auto;">
					<div
						style="width: 80%; height: 70px; background: #222222; margin: 0 auto; float: left;">
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
								<li class="active"><a
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

					<!--下拉菜单和头像-->
					<div style="float: right; padding-right: 30px; padding-top: 23px;">
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
				<form action="upload.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
					<div class="box">
						<div class="file_box">
							<div class="file_name">
								<p class="p_file_name">名称</p>
								<input class="input_name" placeholder=" 请输入视频名" name="prvideo_name" required="required" maxlength="20" >
							</div>
							<div class="file_jianjie">
								<p class="p_file_jianjie">简介</p>
								<textarea class="input_jianjie" placeholder=" 请输入视频简介" name="prvideo_introduce"></textarea>
							</div>
							<div class="upload_box">
								<input type="file" id="file" multiple="multiple" name="pr_video" required="required" maxlength="45"  />
							</div>
							<div class="upload_button_box">
								<button class="upload_button" type="submit">上传</button>
							</div>
						</div>
						<div></div>
						<div></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
