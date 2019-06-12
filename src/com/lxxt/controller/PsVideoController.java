package com.lxxt.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lxxt.po.PsVideo;
import com.lxxt.service.PsVideoService;

@Controller
public class PsVideoController {

	@Autowired
	PsVideoService psVideoService;
	@RequestMapping(value="uploadps.action")
	public String  upload(@RequestParam("psvideo_name")String psvideo_name,
			@RequestParam("psvideo_introduce")String psvideo_introduce,
			@RequestParam("ps_video")List<MultipartFile> ps_video,
			HttpServletRequest request,Model model){
		if(!ps_video.isEmpty()&&ps_video.size()>0){
			for(MultipartFile file:ps_video){
				//String originalFilename = file.getOriginalFilename();
				String dirPath = request.getServletContext().getRealPath("/videos");
				File filePath = new File(dirPath);
				if(!filePath.exists()){
					filePath.mkdirs();
				}
				String newFilename = "_"+UUID.randomUUID();
				System.out.println(newFilename);
				
				model.addAttribute("dirPath",newFilename);
				//String prvideo_route=dirPath+newFilename;
				try {
					//上传到dirPath
					file.transferTo(new File(dirPath,newFilename));
					//信息填入数据库
					psVideoService.insertMsg(psvideo_name, psvideo_introduce,newFilename );
				} catch (Exception e) {
					return "error";
				}
			}
		}
		
		return "redirect:PS_page.action";
	}
	
	@RequestMapping(value = "PS_page.action")
	public String pR_page(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", psVideoService.findByPage(currentPage));//回显分页数据
        return "PS_page";
	}
	
	//toPR_videos_paly.action
	
	@RequestMapping(value="toPS_videos_paly.action")
	public String toPR_videos_paly(
			/*@RequestParam(value="route",defaultValue="",required=false)String route,
			@RequestParam(value="name",defaultValue="",required=false)String name,
			@RequestParam(value="introduce",defaultValue="",required=false)String introduce,*/
			@RequestParam(value="id",defaultValue="",required=false)int id,
			Model model){
		
		
		PsVideo psVideo = psVideoService.findPsById(id);
		
		/*PsVideo psVideo = new PsVideo();
		psVideo.setPsvideo_introduce(introduce);
		psVideo.setPsvideo_name(name);
		psVideo.setPsvideo_route(route);*/
		model.addAttribute("PSVIDEO",psVideo);
		return "PS_videos_paly";
	}
}
