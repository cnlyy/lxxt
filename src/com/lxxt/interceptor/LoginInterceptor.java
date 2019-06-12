package com.lxxt.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lxxt.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 获取请求的URL
		String url = request.getRequestURI();
		// URL：除了登录、忘记密码、注册请求之外，其他的URL都进行拦截
		if (url.indexOf("/login.action") >= 0 || url.indexOf("/Forget_password.action") >= 0||url.indexOf("/register.action")>=0
				|| url.indexOf("/toRegister.action") >= 0 || url.indexOf("/findPass.action") >= 0
				||url.indexOf("/toadminlogin.action") >= 0||url.indexOf("/adminLogin.action") >= 0||
				url.indexOf("/deleteUser.action") >= 0||url.indexOf("/allUser.action") >= 0||
				url.indexOf("/Backstage_GongXiang_page.action") >=0||url.indexOf("/Backstage_See_XuQiu_page.action") >=0||url.indexOf("/Backstage_ZhiBo.action") >=0||
				url.indexOf("/Backstage_ZaZheng_page_details.action") >=0||url.indexOf("/Backstage_ZaZheng_page.action") >=0||url.indexOf("/deleteResource.action")>=0||
				url.indexOf("/deleteTask.action") >=0||url.indexOf("/deleteLive.action")>=0) {
			return true;
		}
		// 获取session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("USER_SESSION");
		// 判断session中是否有用户数据，如果有，则返回true，继续向下执行
		if (user != null) {
			return true;
		}
		// 不符合条件的给出提示信息,并转发到登陆页面
		request.setAttribute("msg", "您还没有登陆,请先登录!");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
		return false;
	}

}
