package com.lxxt.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lxxt.dao.UserDao;
import com.lxxt.po.User;
import com.lxxt.service.UserService;
import com.lxxt.utils.Page;

/**
 * 用户service接口实现类
 * 
 * @author lyy
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	public User findUser(String username, String password) {
		User user = this.userDao.findUser(username, password);
		return user;
	}

	@Override
	public void registerByUsernameAndPassword(User user) {
		userDao.registerByUsernameAndPassword(user.getUsername(), user.getPassword(), user.getProblem(),
				user.getAnswer(), user.getIntegral());
	}

	@Override
	public int changePass(String username, String password, String problem, String answer, String newPass) {
		return userDao.changePass(username, password, newPass, problem, answer);
	}

	@Override
	public String findPass(String username, String problem, String answer) {

		return userDao.findPass(username, problem, answer);
	}

	@Override
	public void deleteUser(String username) {
		userDao.deleteUser(username);
	}

	@Override
	public int selectCount() {
		return userDao.selectCount();
	}

	@Override
	public Page<User> findByPage(int currentPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Page<User> page = new Page<User>();
		// 封装当前页数
		page.setCurrPage(currentPage);

		// 每页显示的数据
		int pageSize = 20;
		page.setPageSize(pageSize);

		// 封装总记录数
		int totalCount = userDao.selectCount();
		page.setTotalCount(totalCount);

		// 封装总页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		page.setTotalPage(num.intValue());

		map.put("start", (currentPage - 1) * pageSize);
		map.put("size", page.getPageSize());
		// 封装每页显示的数据

		List<User> lists = userDao.findByPage(map);
		page.setLists(lists);
		return page;
	}

	@Override
	public int findUsername(String username) {
		return userDao.findUsername(username);
	}

}
