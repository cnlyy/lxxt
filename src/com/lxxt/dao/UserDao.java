package com.lxxt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lxxt.po.User;

/**
 * User接口文件
 * 
 * @author administer
 *
 */
public interface UserDao {

	// 通过账号密码查询用户
	public User findUser(@Param("username") String username, @Param("password") String password);

	// 注册账号密码
	public void registerByUsernameAndPassword(@Param("username") String username, @Param("password") String password,
			@Param("problem") String problem, @Param("answer") String answer, @Param("integral") Integer integral);

	// 修改密码
	// string sql="update Users set password='新密码' where UserId='你要修改的用户名' and
	// problem= '问题' and answer='答案';
	public int changePass(@Param("username") String username, @Param("password") String password,
			@Param("newPass") String newPass, @Param("problem") String problem, @Param("answer") String answer);

	// 找回密码
	public String findPass(@Param("username") String username, @Param("problem") String problem,
			@Param("answer") String answer);

	// 管理员功能：删除用户
	public void deleteUser(String username);

	// 展示所有用户
	// 分页操作，调用findByPage limit分页方法
	List<User> findByPage(HashMap<String, Object> map);

	// 查询用户记录总数
	int selectCount();
	
	// 查看用户名是否存在
	 int findUsername(@Param("username")String username);
}
