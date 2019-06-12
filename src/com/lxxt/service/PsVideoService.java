package com.lxxt.service;


import com.lxxt.po.PsVideo;
import com.lxxt.utils.Page;

public interface PsVideoService {

	public void insertMsg(String psvideo_name,String psvideo_introduce,String psvideo_route);
	
	Page<PsVideo> findByPage(int currentPage);

    int selectCount();
    
    PsVideo findPsById(int id);
}
