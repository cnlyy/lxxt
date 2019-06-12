package com.lxxt.service;

import com.lxxt.po.Live;
import com.lxxt.utils.Page;

public interface LiveService {

	Page<Live> findByPage(int currentPage);

    int selectCount();
    
    void shareLive(String name,String link,String uploader);
    
    void deleteLive(int id);
}
