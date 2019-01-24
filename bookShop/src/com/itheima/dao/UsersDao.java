package com.itheima.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.po.Admins;
import com.itheima.po.Users;
/**
 * Users接口文件
 */
public interface UsersDao {
	/**
	 * 根据id查询用户信息
	 */
	public Users findUsersById(Integer id);
	public int addUsers(Users users);
	public Users findUsersByPw(@Param("userName") String userName,
			@Param("password") String password);
	public List<Users> findAllUsers(List<Users> users);
	public int deleteUser(Integer id);
}
