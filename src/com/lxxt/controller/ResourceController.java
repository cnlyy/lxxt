package com.lxxt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lxxt.po.User;
import com.lxxt.service.ResourceService;

@Controller
@Transactional
public class ResourceController {

	@Autowired
	ResourceService resourceService;
	
	
	@RequestMapping(value = "GongXiang_page.action")
	public String gongXiang_page(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", resourceService.findByPage(currentPage));//回显分页数据
        return "GongXiang_page";
	}
	
	@RequestMapping(value="shareResource.action")
	public String shareResource(HttpSession session,String name,String link){
		User user = (User) session.getAttribute("USER_SESSION");
		String uploader = user.getUsername();
		resourceService.shareResource(name, link, uploader);
		System.out.println("上传者:"+uploader);
		return "redirect:GongXiang_page.action";
	}
	
	@RequestMapping(value = "Backstage_GongXiang_page.action")
	public String backstage_GongXiang_page(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", resourceService.findByPage(currentPage));//回显分页数据
        return "Backstage_GongXiang_page";
	}
	
	@RequestMapping(value="deleteResource.action")
	public String deleteResource(@RequestParam(value="id",defaultValue="",required=false)int id){
		resourceService.deleteResource(id);
		return "redirect:Backstage_GongXiang_page.action";
	}
}
