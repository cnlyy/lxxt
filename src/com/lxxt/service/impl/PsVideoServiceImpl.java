package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.PsVideoDao;
import com.lxxt.po.PsVideo;
import com.lxxt.service.PsVideoService;
import com.lxxt.utils.Page;
@Service("psVideoService")
public class PsVideoServiceImpl implements PsVideoService {

	@Autowired
	PsVideoDao psVedioDao;
	@Override
	public void insertMsg(String psvideo_name, String psvideo_introduce, String psvideo_route) {
		psVedioDao.insertMsg(psvideo_name, psvideo_introduce, psvideo_route);
	}
	@Override
	public Page<PsVideo> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<PsVideo> page = new Page<PsVideo>();
		
		//封装当前页数
		page.setCurrPage(currentPage);
		
		//每页显示的数据
		int pageSize=20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = psVedioDao.selectCount();
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		page.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", page.getPageSize());
		//封装每页显示的数据
		
		List<PsVideo> lists = psVedioDao.findByPage(map);
		page.setLists(lists);
		return page;
	}
	@Override
	public int selectCount() {
		return psVedioDao.selectCount();
	}
	@Override
	public PsVideo findPsById(int id) {
		return psVedioDao.findPsById(id);
	}

}
