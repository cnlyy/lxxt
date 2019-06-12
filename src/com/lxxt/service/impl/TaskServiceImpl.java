package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.TaskDao;
import com.lxxt.po.Task;
import com.lxxt.service.TaskService;
import com.lxxt.utils.Page;

@Service("taskService")
public class TaskServiceImpl implements TaskService {

	@Autowired
	TaskDao taskDao;

	@Override
	public void insertNeed(Task task) {
		// int id = task.getId();
		String title = task.getTitle();
		String publisher = task.getPublisher();
		String describe = task.getDescr();
		String beginTime = task.getBegintime();
		String endTime = task.getEndtime();
		Integer accept = task.getAccept();
		taskDao.insertNeed(title, publisher, describe, beginTime, endTime, accept);
	}

	@Override
	public int selectCount() {

		return taskDao.selectCount();
	}

	@Override
	public Page<Task> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Task> page = new Page<Task>();

		// 封装当前页数
		page.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = taskDao.selectCount();
		page.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		page.setTotalPage(num.intValue());

		map.put("start", (currentPage - 1) * pageSize);
		map.put("size", page.getPageSize());
		// 封装每页显示的数据

		List<Task> lists = taskDao.findByPage(map);
		page.setLists(lists);

		return page;
	}

	@Override
	public Page<Task> findPageByPubliser(String publisher, int currentPage) {
		//HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Task> page = new Page<Task>();

		// 封装当前页数
		page.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = taskDao.selectCount();
		page.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		page.setTotalPage(num.intValue());

		//map.put("start", (currentPage - 1) * pageSize);
		//map.put("size", page.getPageSize());
		Integer start = (currentPage - 1) * pageSize;
		Integer size = page.getPageSize();
		// 封装每页显示的数据

		List<Task> lists = taskDao.findPageByPubliser(publisher,start,size);
		page.setLists(lists);

		return page;
	}

	@Override
	public void deleteTask(int id) {
		taskDao.deleteTask(id);
	}

	@Override
	public Task findTaskById(int id) {
		return taskDao.findTaskById(id);
	}
}
