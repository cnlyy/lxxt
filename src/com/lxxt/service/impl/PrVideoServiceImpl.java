package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.PrVideoDao;
import com.lxxt.po.PrVideo;
import com.lxxt.service.PrVideoService;
import com.lxxt.utils.Page;
@Service("prVideoService")
public class PrVideoServiceImpl implements PrVideoService {
	@Autowired
	PrVideoDao prVideoDao;
	
	@Override
	public void insertMsg(String prvideo_name,String prvideo_introduce,String prvideo_route) {
		
		prVideoDao.insertMsg(prvideo_name, prvideo_introduce, prvideo_route);
	}

	@Override
	public Page<PrVideo> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<PrVideo> page = new Page<PrVideo>();
		
		//封装当前页数
		page.setCurrPage(currentPage);
		
		//每页显示的数据
		int pageSize=20;
		page.setPageSize(pageSize);
		
		//封装总记录数
		int totalCount = prVideoDao.selectCount();
		page.setTotalCount(totalCount);
		
		//封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc/pageSize);
		page.setTotalPage(num.intValue());
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", page.getPageSize());
		//封装每页显示的数据
		
		List<PrVideo> lists = prVideoDao.findByPage(map);
		page.setLists(lists);
		return page;
	}

	@Override
	public int selectCount() {
		return prVideoDao.selectCount();
	}

	@Override
	public PrVideo findPrById(int id) {
		return prVideoDao.findPrById(id);
	}

}
