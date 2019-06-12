package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.Task;

public interface TaskDao {
	
	//发布需求
	public void insertNeed(
			//Integer id,
			@Param("title")String title,
			@Param("publisher")String publisher,
			@Param("descr")String descr,
			@Param("begintime")String begintime,
			@Param("endtime")String endtime,
			@Param("accept")Integer accept
			);
	

	//分页操作，调用findByPage limit分页方法
    List<Task> findByPage(HashMap<String,Object> map);
    //查询用户记录总数
    int selectCount();
    
    List<Task> findPageByPubliser(@Param("publisher")String publisher,@Param("start")Integer start,@Param("size")Integer size);
	
    //删除一条需求
    void deleteTask(@Param("id")int id);
    
    Task findTaskById(@Param("id")int id);
}
