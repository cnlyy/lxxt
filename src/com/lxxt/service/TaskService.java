package com.lxxt.service;




import com.lxxt.po.Task;
import com.lxxt.utils.Page;

public interface TaskService {

	
	//发布需求
	public void insertNeed(Task task);
	
	int selectCount();
	
	Page<Task> findByPage(int currentPage);
	
	Page<Task> findPageByPubliser(String publisher,int currentPage);
	
	void deleteTask(int id);
	
	Task findTaskById(int id);
}
