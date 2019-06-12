package com.lxxt.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lxxt.service.ResourceService;

@Controller
public class ToLinkController {

	@Autowired
	ResourceService resourceService;
	/**
	 *首页跳转链接 
	 */
	/*@RequestMapping(value = "/PR_page.action")
	public String pR_page(){
        return "PR_page";
	}*/
	/*@RequestMapping(value = "/PS_page.action")
	public String pS_page(){
        return "PS_page";
	}*/
	/*@RequestMapping(value = "/GongXiang_page.action")
	public String gongXiang_page(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", resourceService.findByPage(currentPage));//回显分页数据
        return "GongXiang_page";
	}*/
	@RequestMapping(value = "/ZaZheng_page.action")
	public String zaZheng_page(){
        return "ZaZheng_page";
	}
	/*@RequestMapping(value = "/See_XuQiu_page.action")
	public String see_XuQiu_page(){
        return "See_XuQiu_page";
	}*/
	/*@RequestMapping(value = "/ZhiBo.action")
	public String zhiBo(){
        return "ZhiBo";
	}*/
	@RequestMapping(value = "/Forget_password.action")
	public String forget_password(){
        return "Forget_password";
	}
	@RequestMapping(value = "/Change_Password.action")
	public String change_Password(){
        return "Change_Password";
	}
	/*@RequestMapping(value = "/My_release.action")
	public String my_release(){
        return "My_release";
	}*/
	@RequestMapping(value = "/toLogin.action")
	public String toLogin(){
        return "login";
	}
	@RequestMapping(value = "/toRegister.action")
	public String toRegister(){
        return "Register";
	}
	@RequestMapping(value = "/toIndex.action")
	public String toIndex(){
        return "index2";
	}
	@RequestMapping(value = "/PS_videos_paly.action")
	public String pS_videos_paly(){
        return "PS_videos_paly";
	}
	@RequestMapping(value = "/Release_XuQiu_page.action")
	public String release_XuQiu_page(){
        return "Release_XuQiu_page";
	}
	@RequestMapping(value="toUpload_video.action")
	public String upload_video(){
		return "upload_video";
	}
	@RequestMapping(value="toUpload_video_ps.action")
	public String toUpload_video_ps(){
		return "upload_video_ps";
	}
	
	//管理员页的跳转
	@RequestMapping(value="toadminlogin.action")
	public String adminLogin(){
		return "admin_login";
	}
	/*@RequestMapping(value="Backstage_GongXiang_page.action")
	public String backstage_GongXiang_page(){
		return "Backstage_GongXiang_page";
	}*/
	/*@RequestMapping(value="Backstage_See_XuQiu_page.action")
	public String backstage_See_XuQiu_page(){
		return "Backstage_See_XuQiu_page";
	}*/
	@RequestMapping(value="Backstage_ZaZheng_page_details.action")
	public String backstage_ZaZheng_page_details(){
		return "Backstage_ZaZheng_page_details";
	}
	@RequestMapping(value="Backstage_ZaZheng_page.action")
	public String backstage_ZaZheng_page(){
		return "Backstage_ZaZheng_page";
	}
	/*@RequestMapping(value="Backstage_ZhiBo.action")
	public String backstage_ZhiBo(){
		return "Backstage_ZhiBo";
	}*/
}
