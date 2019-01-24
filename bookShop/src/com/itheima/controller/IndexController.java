package com.itheima.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itheima.common.utils.Page;
import com.itheima.po.Admins;
import com.itheima.po.Books;
import com.itheima.po.Orders;
import com.itheima.po.Users;
import com.itheima.service.AdminsService;
import com.itheima.service.BooksService;
import com.itheima.service.OrdersService;
import com.itheima.service.UsersService;

@Controller
public class IndexController {
	@Autowired
	private BooksService booksService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private AdminsService adminsService;

	@RequestMapping(value = "/")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "9") Integer rows,
			Model model) {
		// 条件查询所有客户
		Page<Books> books = booksService.findAllBooks(page, rows);
		model.addAttribute("page", books);

		return "index/index/index";
	}

	@RequestMapping("/register") // 跳转到登陆页面
	public String register() {
		//
		return "index/user/register";
	}

	@RequestMapping("/registerCheck")
	// 确认注册信息并且新建一个用户
	public String registerCheck(Users user, Model model) { // 直接pojo类来接收
		// 通过账号和密码查询用户
		System.out.print(user);
		int number = usersService.addUsers(user);
		if (number > 0) {
			model.addAttribute("result", "😀👍恭喜你注册成功");
			// 杩斿洖瀹㈡埛淇℃伅灞曠ず椤甸潰
			System.out.println("受影响行数" + number);
		} else {
			model.addAttribute("result", "😥请检查你的账号和密码");
			return "register";
		}
		return "index/user/login";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request, Integer detailID, HttpSession session) {

		// 这儿跳转登陆的时候把id也带上
		String url = request.getRequestURI();
		System.out.println("跳转登陆前的页面是");
		String urll = "";
		urll = request.getServletPath();
		System.out.println(url); // 这个是提取出当前的页面的url，这个访问路径是对的
		System.out.println(urll);
		session.setAttribute("detailID", detailID); // 如果这个id不是空的话，加这个传过去就可以了

		return "index/user/login"; // 这个不用改
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST) // 杩欏効鏄烦鍒拌繖鍎胯繘琛岄獙璇佺櫥闄�
//	@ResponseBody
	public String loginCheck(HttpServletRequest request, String userName, String password, Model model,
			HttpSession session) {
		Users user = usersService.findUsersByPw(userName, password);
		if (user != null) {
			// 登陆成功，写入session
			Integer detailID = (Integer) session.getAttribute("detailID"); // 传过来的就是id而已
			session.setAttribute("USER_SESSION", user);
			if (detailID != null) {
				return "redirect:/bookDetail?id=" + detailID;
			}
			return "redirect:/";
		}
		// 登陆不成功
		model.addAttribute("msg", "你的账号或者密码不对");
		return "index/user/login";
	}

	/* 管理员登录界面 */
	@RequestMapping("/adminLogin") // 跳转到登陆页面
	public String adminLogin() {
		// 通过账号和密码查询用户
		return "admin/admins/adminLogin";
	}

	@RequestMapping(value = "/adminLoginCheck", method = RequestMethod.POST) // 这儿是跳到这儿进行验证登陆
	public String adminLoginCheck(HttpServletRequest request, String adminName, String password, Model model,
			HttpSession session) {
		// 通过账号和密码查询用户
		String url = request.getRequestURI();
		Admins admin = adminsService.findAdminsByPw(adminName, password);
		System.out.println(admin);
		;
		if (admin != null) {
			// 将用户添加到session
			session.setAttribute("ADMIN_SESSION", admin);
			// 登陆成功的话，跳转到主页
			return "redirect:admin";
		}
		model.addAttribute("msg", "账号或者密码错误，请重新输入！");
		return "admin/admins/adminLogin";

	}

	@RequestMapping("/logout") // 登出，关掉session的东西
	public String layout(HttpSession session) {
		// 通过账号和密码查询用户
		session.invalidate(); // 清楚session
		return "redirect:/";
		/* return "index/index/index"; */

	}

	@RequestMapping("/adminLayout") // 登出，关掉session的东西
	public String adminLayout(HttpSession session) {
		// 通过账号和密码查询用户
		session.invalidate(); // 清楚session
		return "redirect:/";

	}

	@RequestMapping("/myOrders") // 这儿是显示我的订单
	public String myOrders(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "7") Integer rows, Model model, HttpSession session) {
		Users users = (Users) session.getAttribute("USER_SESSION");
		Integer user_id = users.getId();
		Page<Orders> orders = ordersService.findAllOrders(page, rows, user_id);
		System.out.print(orders.toString());
		model.addAttribute("page", orders);
		return "index/book/myOrders";
	}

}
