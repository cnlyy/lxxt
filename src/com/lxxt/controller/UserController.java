package com.lxxt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lxxt.po.User;
import com.lxxt.service.TaskAcceptService;
import com.lxxt.service.UserService;

/**
 * UserController类
 * 
 * @author lyy
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private TaskAcceptService taskAcceptService;

	/**
	 * 用户登陆
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, Model model, HttpSession session) {
		// 通过账号密码查询用户
		User user = userService.findUser(username, password);
		if (user != null) {
			// 将用户和用户对象添加到session
			session.setAttribute("USER_SESSION", user);
			// 跳转到
			return "index2";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入");
		return "login";
	}

	/**
	 * 退出登陆
	 */
	@RequestMapping("logout.action")
	public String logout(HttpSession session) {
		// 清除session
		session.invalidate();
		// 重定向到登陆页面的跳转方法
		return "login";
	}

	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "login.action", method = RequestMethod.GET)
	public String login() {
		return "redirect:login.action";
	}

	/**
	 * 用户注册
	 */
	@RequestMapping(value = "register.action", method = RequestMethod.POST)
	public String register(String username,String password,String problem,String answer, Model model) {
		User user = new User();
		user.setId(1);
		user.setUsername(username);
		user.setIntegral(0);
		user.setPassword(password);
		user.setAnswer(answer);
		user.setProblem(problem);
		int count = 0;
		count = userService.findUsername(username);
		System.out.println(count);
		if(count==0){
			userService.registerByUsernameAndPassword(user);
			return "login";
		}else{
			model.addAttribute("msg", "用户名已存在");
			return "Register";
		}
	}

	/**
	 * 修改密码
	 */

	@RequestMapping(value = "changePass.action", method = RequestMethod.POST)
	public String changePass(HttpSession session, String password, String problem, String answer, String newPass,Model model) {
		User user = (User) session.getAttribute("USER_SESSION");
		String username = user.getUsername();
		System.out.println(username);
		int flag = userService.changePass(username, password, problem, answer, newPass);
		System.out.println("flag="+flag);
		if(flag>0){
		
			//修改完当前密码后退出已登陆用户使重新登陆，使拦截器生效
			// 清除session
			session.invalidate();
			System.out.println("做到了修改密码这步");
			return "login";
		}
		model.addAttribute("msg", "修改密码失败，请检查原密码、问题或答案是否正确！");
		return "Change_Password";
	}
	/**
	 * 忘记密码
	 */
	@RequestMapping(value="findPass.action",method = RequestMethod.POST)
	public String forget(String username,String problem,String answer,Model model){
		//String text = "找回密码失败，请检查用户名、问题或答案是否正确";
		String text = null;
		text = userService.findPass(username, problem, answer);
		if(text!=null){
			model.addAttribute("msg", text);
		}else{
			model.addAttribute("msg", "找回密码失败，请检查用户名、问题或答案是否正确");
		}
		//String password = userService.findPass(username, problem, answer);
		
		return "Forget_password";
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping(value="deleteUser.action")
	public String deleteUser(@RequestParam("username")String username){
		taskAcceptService.deleteTaskAcceptByUser(username);
		
		userService.deleteUser(username);
		return "redirect:allUser.action";
	}
	
	/**
	 * 展示所有用户
	 */
	@RequestMapping(value="allUser.action")
	public String allUser(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", userService.findByPage(currentPage));//回显分页数据
		return "Backstage_All_user_page";
	}
}
