package com.lxxt.service;

import com.lxxt.po.User;
import com.lxxt.utils.Page;

/**
 * 用户service层接口
 * 
 * @author lyy
 *
 */
public interface UserService {

	// 通过账号密码查询用户
	public User findUser(String username, String password);
	
	//注册
	public void registerByUsernameAndPassword(User user);
	
	//修改密码
	public int changePass(String username,String password,String problem,String answer,String newPass);
	
	//忘记密码
	public String findPass(String username,String problem,String answer);
	
	//删除用户-管理员功能
	public void deleteUser(String username);
	
	//展示用户
	Page<User> findByPage(int currentPage);

	//查询记录数
	int selectCount();
	
	int findUsername(String username);
}
