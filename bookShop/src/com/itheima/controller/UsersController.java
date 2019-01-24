package com.itheima.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.po.Admins;
import com.itheima.po.Users;
import com.itheima.service.UsersService;
@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/findUsersById")
	public String findUsersById(Integer id,Model model) {
		Users users = usersService.findUsersById(id);
		model.addAttribute("users", users);
		//返回客户信息展示页面
		return "admin/users";
	}
	
	/*@RequestMapping("/findUsersById")
	public String findBooksById(Integer id,Model model) {
		Users users = usersService.findUsersById(id);
		model.addAttribute("users", users);
		//返回客户信息展示页面
		return "admin/users";
	}*/
	
	
/*	@RequestMapping("/")
	public String home() {
//		Customer customer = customerService.findCustomerById(id);
//		model.addAttribute("customer", customer);
		//返回客户信息展示页面
		return "admin/test";
	}*/
	
	@RequestMapping("/detial")
	public String home(Integer book_id,Model model) {
		
//		Customer customer = customerService.findCustomerById(id);
//		model.addAttribute("customer", customer);
		//返回客户信息展示页面
		model.addAttribute("book_id", 1); 
		model.addAttribute("bookName", "C++�����ŵ�����");
		model.addAttribute("price", 32.0);
		model.addAttribute("number", 99); //ʣ������
		return "detial";
		
	}
	@RequestMapping("/admin")
	public String admin() {
		return "admin/index/index";
	}
	
	
	@RequestMapping("/shoppingCar")  //���ﳵ,һ�Զ࣬Ȼ�󶩵��������Ŀ����������������
	public String shoppingCar(Integer user_id,Model model) {
		
//		Customer customer = customerService.findCustomerById(id);
//		model.addAttribute("customer", customer);
		//返回客户信息展示页面
		model.addAttribute("user_id", 1); 
		model.addAttribute("order", "C++�����ŵ�����");
		model.addAttribute("price", 32.0);
		model.addAttribute("number", 99); //ʣ������
		return "shoppingCar";
		
	}
	
	
	/*后台对用户信息进行处理*/
	@RequestMapping("findAllUsers")
	public String findAllUsers(Model model) {
		List<Users>users = usersService.findAllUsers();
		model.addAttribute("users", users);
		return "admin/users/users-list";
	}
	
	//用户删除
	/*	
	 * 根据id来删除数据
	 * */
	@RequestMapping("deleteUser")
	@ResponseBody
	public String deleteAdmin(Integer id) {
		int rows = usersService.deleteUser(id);
		if(rows>0) {
			return "ok";
		}else {
			return "fail";
		}
	}
	//批量删除书籍
	@RequestMapping("batchDeletesUsers")
	@ResponseBody
	public void batchDeletesUsers(HttpServletRequest request, HttpServletResponse response) {
			String items = request.getParameter("delitems"); 
			System.out.println(items);
			String[] strs = items.split(",");
	 
			for (int i = 0; i < strs.length; i++) {
				try {
					int a = Integer.parseInt(strs[i]);
					/*System.out.println(a);*/
					usersService.deleteUser(a);
				} catch (Exception e) {
				}
			}
	
	}
	
	
}
