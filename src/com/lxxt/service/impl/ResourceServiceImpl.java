package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.ResourceDao;
import com.lxxt.po.Resource;
import com.lxxt.service.ResourceService;
import com.lxxt.utils.Page;
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	ResourceDao resourceDao;
	
	@Override
	public Page<Resource> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<Resource> page = new Page<Resource>();
		
		//封装当前页数
		page.setCurrPage(currentPage);
		
		//每页显示的数据
		int pageSize=5;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = resourceDao.selectCount();
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		page.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", page.getPageSize());
		//封装每页显示的数据
		
		List<Resource> lists = resourceDao.findByPage(map);
		page.setLists(lists);
		return page;
	}

	@Override
	public int selectCount() {
		return resourceDao.selectCount();
	}

	@Override
	public void shareResource(String name, String link, String uploader) {
		resourceDao.shareResource(name, link, uploader);
	}

	@Override
	public void deleteResource(int id) {
		resourceDao.deleteResource(id);
	}

}
