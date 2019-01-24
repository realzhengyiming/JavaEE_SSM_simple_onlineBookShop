package com.itheima.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.dao.AdminsDao;
import com.itheima.dao.BooksDao;
import com.itheima.po.Admins;
import com.itheima.po.Books;
import com.itheima.po.Users;
import com.itheima.service.AdminsService;
import com.itheima.service.BooksService;

@Service
@Transactional
public class AdminsServiceImpl implements AdminsService {
	//注解注入CustomerDao
	@Autowired
	private AdminsDao adminsDao;
	//查询书籍

	@Override
	public Admins findAdminsById(Integer id) {
		// TODO Auto-generated method stub
		return this.adminsDao.findAdminsById(id);
	}

	@Override
	public List<Admins> findAllAdmins() {
		// TODO Auto-generated method stub
		return (List<Admins>) this.adminsDao.findAllAdmins(null);
	}

	@Override
	public int addAdmin(Admins admins) {
		// TODO Auto-generated method stub
		return adminsDao.addAdmin(admins);
	}

	@Override
	public int deleteAdmin(Integer id) {
		// TODO Auto-generated method stub
		return adminsDao.deleteAdmin(id);
	}
	//修改管理员信息
	@Override
	public Admins editAdmin(Integer id) {
		// TODO Auto-generated method stub
		return this.adminsDao.findAdminsById(id);
	}

	@Override
	public int updateAdmin(Admins admins) {
		// TODO Auto-generated method stub
		return this.adminsDao.updateAdmin(admins);
	}
	public Admins findAdminsByPw(String adminName,String password) {
		return this.adminsDao.findAdminsByPw(adminName,password);
	}
	
	

}
