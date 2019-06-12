package com.lxxt.dao;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.Admin;



public interface AdminDao {

	public Admin findAdmin(@Param("username")String username,@Param("password")String password);
}
