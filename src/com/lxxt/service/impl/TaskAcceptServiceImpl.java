package com.lxxt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.TaskAcceptDao;
import com.lxxt.po.TaskAccept;
import com.lxxt.service.TaskAcceptService;
import com.lxxt.utils.Page;

@Service("taskAcceptService")
public class TaskAcceptServiceImpl implements TaskAcceptService {

	@Autowired
	TaskAcceptDao taskAcceptDao;

	@Override
	public void taskAccept(String acceptuser, String skill, String nickname, String wechat, int taskid) {
		taskAcceptDao.taskAccept(acceptuser, skill, nickname, wechat, taskid);
	}

	@Override
	public void updateAccept(int id, int newAccept) {
		taskAcceptDao.updateAccept(id, newAccept);
	}

	@Override
	public Page<TaskAccept> findMsgOfAccept(int taskid, int currentPage) {
		// HashMap<String, Object> map = new HashMap<String, Object>();
		Page<TaskAccept> page = new Page<TaskAccept>();

		// 封装当前页数
		page.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = taskAcceptDao.selectCount();
		page.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		page.setTotalPage(num.intValue());

		// map.put("start", (currentPage - 1) * pageSize);
		// map.put("size", page.getPageSize());
		Integer start = (currentPage - 1) * pageSize;
		Integer size = page.getPageSize();
		// 封装每页显示的数据

		List<TaskAccept> lists = taskAcceptDao.findMsgOfAccept(taskid, start, size);
		page.setLists(lists);

		return page;
	}

	@Override
	public int selectCount() {
		return taskAcceptDao.selectCount();
	}

	@Override
	public void deleteTaskAccept(int taskid) {
		taskAcceptDao.deleteTaskAccept(taskid);
	}

	@Override
	public void deleteTaskAcceptByUser(String acceptuser) {
		taskAcceptDao.deleteTaskAcceptByUser(acceptuser);
	}

}
