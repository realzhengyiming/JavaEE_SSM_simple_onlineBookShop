package com.itheima.service;

import java.util.List;

import com.itheima.po.Admins;
import com.itheima.po.Users;

public interface AdminsService {
	public Admins findAdminsById(Integer id);
	public List<Admins> findAllAdmins();
	public int addAdmin(Admins admins);
	public int deleteAdmin(Integer id);
	public Admins editAdmin(Integer id);
	public int updateAdmin(Admins admins);
	public Admins findAdminsByPw(String adminName,String password);
}
