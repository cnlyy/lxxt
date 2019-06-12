package com.lxxt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxxt.po.Admin;
import com.lxxt.service.AdminService;

@Controller
@Transactional
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value="adminLogin.action")
	public String adminLogin(String username,String password, Model model, HttpSession session){
		Admin admin = adminService.findAdmin(username, password);
		
		if (admin != null) {
			// 将用户和用户对象添加到session
			session.setAttribute("ADMIN_SESSION", admin);
			//System.out.println("登陸成功");
			// 跳转到
			return "redirect:allUser.action";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入");
		return "admin_login";
	}
}
