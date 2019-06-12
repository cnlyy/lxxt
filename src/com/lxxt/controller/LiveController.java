package com.lxxt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lxxt.po.User;
import com.lxxt.service.LiveService;

@Controller
@Transactional
public class LiveController {

	@Autowired
	LiveService liveService;
	
	
	@RequestMapping(value="ZhiBo.action")
	public String zhiBo(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", liveService.findByPage(currentPage));
		return "ZhiBo";
	}
	
	@RequestMapping(value="shareLive.action")
	public String shareLive(HttpSession session,String name,String link){
		User user = (User) session.getAttribute("USER_SESSION");
		String uploader = user.getUsername();
		liveService.shareLive(name, link, uploader);
		System.out.println("上传者："+uploader);
		return "redirect:ZhiBo.action";
	}
	
	@RequestMapping(value="Backstage_ZhiBo.action")
	public String Backstage_ZhiBo(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", liveService.findByPage(currentPage));
		return "Backstage_ZhiBo";
	}
	
	@RequestMapping("deleteLive.action")
	public String deleteLive(@RequestParam(value="id",defaultValue="",required=false)int id){
		liveService.deleteLive(id);
		return "redirect:Backstage_ZhiBo.action";
	}
}
