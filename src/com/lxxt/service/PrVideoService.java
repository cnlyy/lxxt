package com.lxxt.service;


import com.lxxt.po.PrVideo;
import com.lxxt.utils.Page;

public interface PrVideoService {

	public void insertMsg(String prvideo_name,String prvideo_introduce,String prvideo_route);
	
	Page<PrVideo> findByPage(int currentPage);

    int selectCount();
    
    PrVideo findPrById(int id);
}
