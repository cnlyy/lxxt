package com.lxxt.service;

import com.lxxt.po.Admin;

public interface AdminService {

	public Admin findAdmin(String username,String password);
}
