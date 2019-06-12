package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.LiveDao;
import com.lxxt.po.Live;
import com.lxxt.service.LiveService;
import com.lxxt.utils.Page;

@Service("liveService")
public class LiveServiceImpl implements LiveService {

	@Autowired
	LiveDao liveDao;
	
	@Override
	public Page<Live> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String,Object>();
		Page<Live> page = new Page<Live>();
		//封装当前页数
		page.setCurrPage(currentPage);
		//每页显示数据
		int pageSize=20;
		page.setPageSize(pageSize);
		//封装总记录数
		int totalCount = liveDao.selectCount();
		page.setTotalCount(totalCount);
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		page.setTotalPage(num.intValue());
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", page.getPageSize());
		//封装每页显示的数据
		List<Live> lists = liveDao.findByPage(map);
		page.setLists(lists);
		return page;
	}

	@Override
	public int selectCount() {
		return liveDao.selectCount();
	}

	@Override
	public void shareLive(String name, String link, String uploader) {
		liveDao.shareLive(name, link, uploader);
	}

	@Override
	public void deleteLive(int id) {
		liveDao.deleteLive(id);
	}

}
