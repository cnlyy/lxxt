package com.lxxt.service;


import com.lxxt.po.Resource;
import com.lxxt.utils.Page;




public interface ResourceService {

	
    Page<Resource> findByPage(int currentPage);

    int selectCount();
    
    void shareResource(String name,String link,String uploader);
    
    void deleteResource(int id);
}
