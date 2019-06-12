package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.PsVideo;

public interface PsVideoDao {
	//插入信息
		public void insertMsg(
				@Param("psvideo_name")String psvideo_name,
				@Param("psvideo_introduce")String psvideo_introduce,
				@Param("psvideo_route")String psvideo_route
				);
		
		//分页操作，调用findByPage limit分页方法
	    List<PsVideo> findByPage(HashMap<String,Object> map);
	    //查询用户记录总数
	    int selectCount();
	    
	    PsVideo findPsById(@Param("id")int id);

}
