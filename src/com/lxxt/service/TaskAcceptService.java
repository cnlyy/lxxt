package com.lxxt.service;

import com.lxxt.po.TaskAccept;
import com.lxxt.utils.Page;

public interface TaskAcceptService {

	//接任务
	public void taskAccept(String acceptuser,String skill,String nickname,String wechat,int taskid);
	//更新accept
	public void updateAccept(int id,int newAccept);
	
	Page<TaskAccept> findMsgOfAccept(int taskid,int currentPage);
	
	int selectCount();
	
	void deleteTaskAccept(int taskid);
	
	void deleteTaskAcceptByUser(String acceptuser);
}
