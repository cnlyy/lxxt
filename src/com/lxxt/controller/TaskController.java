package com.lxxt.controller;

import java.io.UnsupportedEncodingException;

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
import com.lxxt.service.TaskService;

@Controller
@Transactional
public class TaskController {

	@Autowired
	TaskService taskService;
	@Autowired
	TaskAcceptService taskAcceptService;

	@RequestMapping(value = "See_XuQiu_page.action")
	public String see_XuQiu_page(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		model.addAttribute("pagemsg", taskService.findByPage(currentPage));// 回显分页数据
		return "See_XuQiu_page";
	}
	
	// 我的发布
		@RequestMapping(value = "/My_release.action")
		public String my_release(@RequestParam(value = "publisher", defaultValue = "", required = false)String publisher,
				@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage,
				Model model) {
			model.addAttribute("pagemsg", taskService.findPageByPubliser(publisher, currentPage));// 回显分页数据
			return "My_release";
		}
	

	@RequestMapping(value = "insertNeed.action", method = RequestMethod.POST)
	public String insertNeed(String title, String descr, String begintime, String endtime, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("USER_SESSION");
		String publisher = user.getUsername();
		Task task = new Task();
		// 给Task类添加数据
		// 新添任务时接任务人数为0
		Integer accept = 0;
		task.setTitle(title);
		task.setPublisher(publisher);
		task.setDescr(descr);
		task.setBegintime(begintime);
		task.setEndtime(endtime);
		task.setAccept(accept);
		// System.out.println(task);
		taskService.insertNeed(task);
		return "redirect:See_XuQiu_page.action";
	}

	// 接任务
	@RequestMapping(value = "/Receive_tasks.action")
	public String receive_tasks(@RequestParam(value = "id", defaultValue = "1", required = false) int id,
			/*@RequestParam(value = "title", defaultValue = "", required = false) String title,
			@RequestParam(value = "publisher", defaultValue = "", required = false) String publisher,
			@RequestParam(value = "descr", defaultValue = "", required = false) String descr,
			@RequestParam(value = "begintime", defaultValue = "", required = false) String begintime,
			@RequestParam(value = "endtime", defaultValue = "", required = false) String endtime,
			@RequestParam(value = "accept", defaultValue = "", required = false) int accept,*/ 
			Model model,
			HttpSession session, String skill, String nickname, String wechat) throws UnsupportedEncodingException {
		
		
		//String descr2 = new String(descr.getBytes("iso8859-1"), "UTF-8");
		// userName = new String(userName.getBytes("iso8859-1"), "UTF-8");
		// System.out.println(publisher+" "+title+" "+descr2+" "+begintime+"
		// "+endtime+" "+accept);

		Task task = taskService.findTaskById(id);
		
		/*Task task = new Task();
		task.setId(id);
		task.setDescr(descr2);
		task.setTitle(title);
		task.setPublisher(publisher);
		task.setAccept(accept);
		task.setBegintime(begintime);
		task.setEndtime(endtime);*/
		
		session.setAttribute("TASK", task);
		model.addAttribute("TASK", task);// 前端显示数据
		return "Receive_tasks";
	}

	
	
	@RequestMapping(value = "Backstage_See_XuQiu_page.action")
	public String backstage_See_XuQiu_page(
			@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, Model model) {
		model.addAttribute("pagemsg", taskService.findByPage(currentPage));// 回显分页数据
		return "Backstage_See_XuQiu_page";
	}
	
	@RequestMapping(value="deleteTask.action")
	public String deleteTask(@RequestParam(value="id",defaultValue="",required=false)int id){
		//先删除接受任务表，其中有外键
		System.out.println(0);
		System.out.println(1);
		taskAcceptService.deleteTaskAccept(id);
		System.out.println(2);
		//再删除任务表
		taskService.deleteTask(id);
		System.out.println(3);
		return "redirect:Backstage_See_XuQiu_page.action";
	}
}
