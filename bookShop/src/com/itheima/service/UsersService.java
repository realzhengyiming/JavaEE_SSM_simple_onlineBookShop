package com.itheima.service;
import java.util.List;

import com.itheima.po.Users;
public interface UsersService {
	public Users findUsersById(Integer id);
	public int addUsers(Users users);
	/*用户登录*/
	public Users findUsersByPw(String userName,String password);
	//以下是后台对用户的管理
	public List<Users> findAllUsers();
	public int deleteUser(Integer id);
}
