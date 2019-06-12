package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.Live;



public interface LiveDao {

	//分页操作，调用findByPage limit分页方法
    List<Live> findByPage(HashMap<String,Object> map);
    //查询用户记录总数
    int selectCount();
    //分享 
    void shareLive(@Param("name")String name,@Param("link")String link,@Param("uploader")String uploader);
    
    void deleteLive(@Param("id")int id);
}
