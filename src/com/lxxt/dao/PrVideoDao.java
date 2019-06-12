package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.PrVideo;

public interface PrVideoDao {
	//插入信息
	public void insertMsg(
			@Param("prvideo_name")String prvideo_name,
			@Param("prvideo_introduce")String prvideo_introduce,
			@Param("prvideo_route")String prvideo_route
			);
	
	
	//分页操作，调用findByPage limit分页方法
    List<PrVideo> findByPage(HashMap<String,Object> map);
    //查询用户记录总数
    int selectCount();
    
    
    PrVideo findPrById(@Param("id")int id);
}
