package com.lxxt.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.TaskAccept;

public interface TaskAcceptDao {

	//接任务
	public void taskAccept(
			@Param("acceptuser")String acceptuser,
			@Param("skill")String skill,
			@Param("nickname")String nickname,
			@Param("wechat")String wechat,
			@Param("taskid")int taskid);
	
	//接任务后Task表的accept+1;
	public void updateAccept(@Param("id")int id,@Param("newAccept") int newAccept);
	
	
	
	//查询用户记录总数
    int selectCount();
	//查看接任务人信息
	public  List<TaskAccept> findMsgOfAccept(@Param("taskid")int taskid,@Param("start")int start,@Param("size")int size);
	
	void deleteTaskAccept(@Param("taskid")int taskid);
	
	void deleteTaskAcceptByUser(@Param("user")String user);
}


