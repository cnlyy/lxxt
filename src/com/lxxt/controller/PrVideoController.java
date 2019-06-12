package com.lxxt.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lxxt.po.PrVideo;
import com.lxxt.service.PrVideoService;

@Controller
@Transactional
public class PrVideoController {

	@Autowired
	PrVideoService prVideoService;
	
	@RequestMapping(value="upload.action")
	public String  upload(@RequestParam("prvideo_name")String prvideo_name,
			@RequestParam("prvideo_introduce")String prvideo_introduce,
			@RequestParam("pr_video")List<MultipartFile> pr_video,
			HttpServletRequest request,Model model){
		if(!pr_video.isEmpty()&&pr_video.size()>0){
			for(MultipartFile file:pr_video){
				//String originalFilename = file.getOriginalFilename();
				String dirPath = request.getServletContext().getRealPath("/videos");
				File filePath = new File(dirPath);
				if(!filePath.exists()){
					filePath.mkdirs();
				}
				/*String newFilename = prvideo_name+"_"+UUID.randomUUID()+"_"+originalFilename;*/
				String newFilename = "_"+UUID.randomUUID();
				System.out.println(newFilename);
				
				model.addAttribute("dirPath",newFilename);
				//String prvideo_route=dirPath+newFilename;
				try {
					//上传到dirPath
					file.transferTo(new File(dirPath,newFilename));
					//信息填入数据库
					prVideoService.insertMsg(prvideo_name, prvideo_introduce,newFilename );
				} catch (Exception e) {
					return "error";
				}
			}
		}	
		return "redirect:PR_page.action";
	}
	
	@RequestMapping(value = "PR_page.action")
	public String pR_page(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Model model){
		model.addAttribute("pagemsg", prVideoService.findByPage(currentPage));//回显分页数据
        return "PR_page";
	}
	
	//toPR_videos_paly.action
	
	@RequestMapping(value="toPR_videos_paly.action")
	public String toPR_videos_paly(
			/*@RequestParam(value="route",defaultValue="",required=false)String route,
			@RequestParam(value="name",defaultValue="",required=false)String name,
			@RequestParam(value="introduce",defaultValue="",required=false)String introduce,*/
			@RequestParam(value="id",defaultValue="",required=false)int id,
			Model model){
		PrVideo prVideo = prVideoService.findPrById(id);
		
		/*PrVideo prVideo = new PrVideo();
		prVideo.setPrvideo_introduce(introduce);
		prVideo.setPrvideo_name(name);
		prVideo.setPrvideo_route(route);*/
		
		model.addAttribute("PRVIDEO",prVideo);
		return "PR_videos_paly";
	}
	
}
