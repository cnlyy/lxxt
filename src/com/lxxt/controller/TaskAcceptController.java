package com.lxxt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lxxt.po.Task;
import com.lxxt.po.User;
import com.lxxt.service.TaskAcceptService;

@Controller
@Transactional
public class TaskAcceptController {

	@Autowired
	TaskAcceptService taskAcceptService;

	// 提交接任务申请
	// taskAccept.action
	@RequestMapping(value = "taskAccept.action", method = RequestMethod.POST)
	public String taskAccept(String skill, String nickname, String wechat, Model model, HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		String acceptuser = user.getUsername();
		System.out.println(acceptuser);

		Task task = (Task) session.getAttribute("TASK");
		int taskid = task.getId();
		System.out.println(taskid);

		int oldaccept = task.getAccept();
		int newAccept = oldaccept + 1;

		taskAcceptService.taskAccept(acceptuser, skill, nickname, wechat, taskid);
		taskAcceptService.updateAccept(taskid, newAccept);
		return "redirect:See_XuQiu_page.action";
	}

	// showAccept.action
	@RequestMapping(value = "showAccept.action")
	public String showAccept(@RequestParam(value = "taskid", defaultValue = "", required = false) Integer taskid,
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		model.addAttribute("pagemsg", taskAcceptService.findMsgOfAccept(taskid, currentPage));// 回显分页数据
		return "showAccept";
	}

}
