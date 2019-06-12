package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.Resource;




public interface ResourceDao {

	 //分页操作，调用findByPage limit分页方法
    List<Resource> findByPage(HashMap<String,Object> map);
    //查询用户记录总数
    int selectCount();
    
    //分享 
    void shareResource(@Param("name")String name,@Param("link")String link,@Param("uploader")String uploader);
    
    //删除资源
    void deleteResource(@Param("id")int id);
}
