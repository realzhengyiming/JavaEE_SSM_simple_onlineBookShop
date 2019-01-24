package com.itheima.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itheima.dao.UsersDao;
import com.itheima.po.Admins;
import com.itheima.po.Users;
import com.itheima.service.UsersService;
@Service
@Transactional
public class UsersServiceImpl implements UsersService {
	//注解注入CustomerDao
	@Autowired
	private UsersDao usersDao;
	//查询客户
	public Users findUsersById(Integer id) {
		return this.usersDao.findUsersById(id);
	}
	@Override
	public int addUsers(Users users) {
		// TODO Auto-generated method stub
		return this.usersDao.addUsers(users);
	}
	//查询客户
	public Users findUsersByPw(String userName,String password) {
		return this.usersDao.findUsersByPw(userName,password);
	}
	@Override
	public List<Users> findAllUsers() {
		// TODO Auto-generated method stub
		return (List<Users>) this.usersDao.findAllUsers(null);
	}
	@Override
	public int deleteUser(Integer id) {
		// TODO Auto-generated method stub
		return usersDao.deleteUser(id);
	}
}
