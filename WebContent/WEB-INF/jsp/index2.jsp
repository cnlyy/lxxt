<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link type="text/css" rel="stylesheet" href="css/caidan.css">
<link type="text/css" rel="stylesheet" href="css/li.css">
<link type="text/css" rel="stylesheet" href="css/index_synopsis.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/jquery.skippr.css">
<meta charset="gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>漓享学堂</title>
<style></style>
</head>
<body style="margin: 0;">
<div class="div-relative"> 
  <!--*** JS ***-->
  <div class="div-a"> 
    <!--asdas<br/>asdas<br/>asdas<br/>asdas<br/>-->
    <div class="hero">
      <div id="random"> 
        
        <!--<div class="yellow"></div>-->
        <div style="background-image: url(images/Wheel_planting/test1.jpg)"></div>
        <div style="background-image: url(images/Wheel_planting/test2.jpg)"></div>
        <div style="background-image: url(images/Wheel_planting/test3.jpg)"></div>
        <div style="background-image: url(images/Wheel_planting/test4.jpg)"></div>
        <div style="background-image: url(images/Wheel_planting/test5.jpg)"></div>
      </div>
      <div class="container">
        <div class="tagline">
          <h1>欢迎.</h1>
          <p>来 到 漓 享 学 堂.</p>
        </div>
      </div>
    </div>
    <script src="js/jquery.min.js"></script> 
    <script src="js/jquery.skippr.min.js"></script> 
    <script>
            $(document).ready(function() {
                $("#random").skippr();
            });

        </script>
    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"> </div>
    <!--=============================================================================-->
    <div class="index_jianjie">
      <div class="jianjie_1">
        <div class="jianjie_1_1">
          <div class="title">
            <p class="p_title">PR简介</p>
          </div>
          <div class="jianjie_box">
            <p class="p_jianjie_box">Adobe Premiere是一款常用的视频编辑软件，由Adobe公司推出。Adobe Premiere是一款编辑画面质量比较好的软件，有较好的兼容性。目前这款软件广泛应用于广告制作和电视节目制作中。 其最新版本为Adobe Premiere Pro CC 2019。</p>
          </div>
          <div class="jianjie_img_box"><img class="jianjie_img" src="images/video.jpg"></div>
        </div>
      </div>
      <!--*******************************简介二***-->
      <div class="jianjie_2">
        <div class="jianjie_2_1">
          <div class="title">
            <p class="p_title">PS简介</p>
          </div>
          <div class="jianjie_box">
            <p class="p_jianjie_box">Adobe Photoshop，简称“PS”，是由Adobe Systems开发和发行的图像处理软件。Photoshop主要处理以像素所构成的数字图像。ps有很多功能，在图像、图形、文字、视频、出版等各方面都有涉及。</p>
          </div>
          <div class="jianjie_img_box"><img class="jianjie_img" src="images/picture.jpg"></div>
        </div>
      </div>
      <!--******************************简介三****-->
      <div class="jianjie_3">
        <div class="jianjie_3_1">
          <div class="title">
            <p class="p_title">其他</p>
          </div>
          <div class="jianjie_box">
            <p class="p_jianjie_box">这是一个资源共享的平台，您可以在这里帮助别人或者请别人来帮助你。您可以在这个分享一下好的资源，如PPT模板。</p>
          </div>
          <div class="jianjie_img_box"><img class="jianjie_img" src="images/other.jpg"></div>
        </div>
      </div>
      <!--**********************************--> 
    </div>
    
    <!--***********************************************--> 
    <!--***********************************************-->
    
    <div class="foot">
      <div class="foot_box">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p class="foot_margin_top">0</p>
        <p class="foot_title">广西师范大学漓江学院理工学院</p>
        <p class="foot_img"><a href = "JavaScript:void(0)" onclick = "openDialog()"><img src="images/WeChat.png"></a></p>
        <p class="foot_gzh">官方微信公众号</p>
        <p class="foot_margin_top">0</p>
      </div>
    </div>
    
    <!--	*****弹出微信公众号二维码*****-->
    <div id="light" class="white_content"> <img style="width: 100%;" src="images/qrcode.jpg"> <br>
      <a href = "javascript:void(0)" onclick = "closeDialog()">点这里关闭本窗口</a> </div>
    <div id="fade" class="black_overlay"></div>
  </div>
  <div class="div-b"><!--菜单-->
    <div style="width: 100%;height: 70px;background: #222222;">
      <div style="width: 980px;height: 100%;background: #222222;margin: 0 auto;">
        <div style="width: 980px;height: 100%; background: #222222;">
          <div><!--主菜单-->
            <div style="width: 85%;height: 70px;background: #222222;margin: 0 auto;float: left;">
              <div class="logo"> <a href="${pageContext.request.contextPath }/toIndex.action"> <img src="images/logo4.gif" width="100" alt="漓享学堂"> </a> </div>
              <div class="text">
                <ul>
                  <li class="active"><a href="${pageContext.request.contextPath }/toIndex.action"> <em>首页</em> </a></li>
                  <li><a href="${pageContext.request.contextPath }/PR_page.action"> <em>PR</em> </a></li>
                  <li><a href="${pageContext.request.contextPath }/PS_page.action"> <em>PS</em> </a></li>
                  <li><a href="${pageContext.request.contextPath }/GongXiang_page.action"> <em>资源共享</em> </a></li>
                <%--   <li><a href="${pageContext.request.contextPath }/ZaZheng_page.action"> <em>疑难杂症</em> </a></li> --%>
                  <li><a href="${pageContext.request.contextPath }/See_XuQiu_page.action"> <em>需求发布</em> </a></li>
					<li><a href="${pageContext.request.contextPath }/ZhiBo.action"> <em>在线直播</em> </a></li>
                </ul>
              </div>
            </div>
          </div>
          <div><!--下拉菜单-->
            <div style="height: 35px;float: right;padding-right: 10px;padding-top: 23px;">
              <div class="touxiang"><img src="images/user.png" class="img_touxiang"></div>
              <div class="dropdown">
                <button class="dropbtn">${USER_SESSION.username}</button>
                <div class="dropdown-content"> <a href="${pageContext.request.contextPath }/My_release.action?publisher=${USER_SESSION.username}"> 我的发布</a> <a href="${pageContext.request.contextPath }/Change_Password.action">修改密码</a> <a href="${pageContext.request.contextPath }/logout.action">退出登录</a> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
        $(function(){
        })
        function openDialog(){
            document.getElementById('light').style.display='block';
            document.getElementById('fade').style.display='block'
        }
        function closeDialog(){
            document.getElementById('light').style.display='none';
            document.getElementById('fade').style.display='none'
        }
    </script>
</html>