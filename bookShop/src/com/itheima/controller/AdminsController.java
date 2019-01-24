package com.itheima.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.po.*;
import com.itheima.service.AdminsService;
import com.itheima.service.BooksService;

@Controller
public class AdminsController {
	@Autowired
	private AdminsService adminsService;

	// welocome
	@RequestMapping("welcome")
	public String welcome() {
		return "admin/index/welcome";
	}

	/*
	 * 添加数据
	 */
	@RequestMapping("addAdminPage")
	public String addAdminPage() {
		return "admin/admins/admins-add";
	}

	@RequestMapping(value = "addAdmin", method = RequestMethod.POST)
	@ResponseBody
	public String addAdmin(@RequestBody Admins admins) {
		System.out.print(admins);
		int rows = adminsService.addAdmin(admins);
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	/*
	 * 根据id来删除数据
	 */
	@RequestMapping("deleteAdmin")
	@ResponseBody
	public String deleteAdmin(Integer id) {
		int rows = adminsService.deleteAdmin(id);
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	// 批量删除书籍
	@RequestMapping("batchDeletesAdmins")
	@ResponseBody
	public void batchDeletesAdmins(HttpServletRequest request, HttpServletResponse response) {
		String items = request.getParameter("delitems");
		System.out.println(items);
		String[] strs = items.split(",");

		for (int i = 0; i < strs.length; i++) {
			try {
				int a = Integer.parseInt(strs[i]);
				/* System.out.println(a); */
				adminsService.deleteAdmin(a);
			} catch (Exception e) {
			}
		}
	}

	/*
	 * 修改管理员数据
	 */
	@RequestMapping("/editAdmin")
	public String editAdmin(Integer id, Model model) {
		Admins admins = adminsService.findAdminsById(id);
		model.addAttribute("admins", admins);
		return "admin/admins/admins-edit";
	}

	@RequestMapping(value = "editAdminMess", method = RequestMethod.POST)
	@ResponseBody
	public String editAdminMess(@RequestBody Admins admins) {
		System.out.print(admins);
		int rows = adminsService.updateAdmin(admins);
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	/*
	 * 查询数据
	 **/
	// 获取全部管理员信息
	@RequestMapping("/adminList")
	public String findAllAdmins(Model model) {
		List<Admins> admins = adminsService.findAllAdmins();
		System.out.print(admins);

		model.addAttribute("admins", admins);
		return "admin/admins/admins-list";
	}

	// 根据id来查询数据
	@RequestMapping("/findAdminsById")
	public String findAllBooks(Integer id, Model model) {
		Admins admins = adminsService.findAdminsById(id);
		model.addAttribute("admins", admins);
		return "admin/admins/admins-list";
	}
}
