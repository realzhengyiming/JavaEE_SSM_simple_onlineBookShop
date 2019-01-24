package com.itheima.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.po.*;

public interface AdminsDao {
	//添加管理员
	public int addAdmin(Admins admins);
	//删除管理员
	public int deleteAdmin(Integer id);
	//根据id来查询管理员
	public Admins findAdminsById(Integer id);
	//查询所有的管理员
	public List<Admins> findAllAdmins(List<Admins> admins);
	public Admins findAdminsByPw(@Param("adminName") String adminName,
			@Param("password") String password);
	/*修改
	管理员*/
	//获取选中的管理员的信息
	public Admins editAdmin(Integer id);
	//更新管理员的信息
	public int updateAdmin(Admins admins);
	
}
