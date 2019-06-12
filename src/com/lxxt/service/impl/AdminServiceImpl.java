package com.lxxt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxxt.dao.AdminDao;
import com.lxxt.po.Admin;
import com.lxxt.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao adminDao;

	@Override
	public Admin findAdmin(String username, String password) {
		return adminDao.findAdmin(username, password);
	}
	
}
