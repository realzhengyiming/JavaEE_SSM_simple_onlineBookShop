package com.itheima.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.common.utils.Page;
import com.itheima.dao.UsersDao;
import com.itheima.po.Admins;
import com.itheima.po.ItemModel;
import com.itheima.po.Items;
import com.itheima.po.Orders;
import com.itheima.po.Users;
import com.itheima.service.BooksService;
import com.itheima.service.ItemsService;
import com.itheima.service.OrdersService;
import com.itheima.service.UsersService;

@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private ItemsService itemsService;
	@Autowired
	private BooksService booksService;

//购物车操作
	@RequestMapping("/intoOrder")
	@ResponseBody
	public String intoOrder(String bookId, String bookNumber, String bookName, String bookPrice, String userName,
			String bookPhoto) {
		Items items = new Items();
		items.setBookId(Integer.parseInt(bookId));
		items.setBookName(bookName);
		items.setBookNum(Integer.parseInt(bookNumber));
		items.setBookPrice(Double.parseDouble(bookPrice));
		items.setBookPhoto(bookPhoto);
		items.setUserName(userName);
		int rows = itemsService.intoOrder(items);
		// 这儿写调用插入数据库的操作。
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping("/shoppingCarPage")
	public String shoppingCarPage(Model model, HttpSession session) {
		// String userName = "麦发强";
		Users users = new Users();
		users = (Users) session.getAttribute("USER_SESSION");
		String userName = users.getUserName();
		List<Items> items = itemsService.getCarByUser(userName);
		System.out.print(items);
		model.addAttribute("cars", items);
		return "common/order/shopCarPage";
	}

	@RequestMapping("/deleteCar")
	@ResponseBody
	public String deleteCar(Integer id) {
		int rows = itemsService.deleteCar(id);
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}

	}

	@RequestMapping(value = "/confirmOrder", method = { RequestMethod.POST }) // 这儿收到以后要做数据库的相减的操作。
	public String confirmOrder(ItemModel items, HttpSession session) throws Exception {
		{
			List<Items> resultList = new ArrayList<Items>(); // 这个就是最终接收到的点击了 checkbox确认提交成为订单的表单
			String result = "";
			List<Items> itemList = items.getItems();
			// 清理一下提交过来 checkbox未选中的物品 这儿是通过double price 这个字段来判断的，如果是0.0的话，那就删掉
			for (int i = 0; i < itemList.size(); i++) {
				double d;
				if (itemList.get(i).getBookPrice() != 0.0) {
					resultList.add(itemList.get(i));// 如果不是的话就这样加入进去,就可以了
				}
			}
			System.out.println("接收到的对象有");
			System.out.println("接收到的长度有" + resultList.size() + "个"); // 多少个
			for (int i = 0; i < resultList.size(); i++) {
				System.out.println("接收到的长度有" + resultList.get(i)); // 多少个
			}
			// 开始执行购物车提交订单的后端操作
			for (int i = 0; i < resultList.size(); i++) {
				Items ite = resultList.get(i);
				// 执行购买操作
				int user_id = ((Users) session.getAttribute("USER_SESSION")).getId();// 获取用户的id
				SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
				String t = time.format(new Date());// new Date()为获取当前系统时间
				Orders orders = new Orders();
				orders.setUser_id(user_id);
				orders.setBook_id(ite.getBookId());
				orders.setBook_name(ite.getBookName());
				orders.setBook_num(ite.getBookNum());
				orders.setTime(t);
				int rows = ordersService.createOrder(orders);
				// int rows = ordersService.insertOrder();
				// 执行购物车表的删除
				if (rows >= 1) {
					int item_id = ite.getId();// 获取订单表的id来执行提交之后的订单数据删除
					int rows_deleteItems = itemsService.deleteItems(item_id);
					if (rows_deleteItems >= 1) {
						// 执行修改存操作
						int book_id = ite.getBookId();// 获取提交过来的购买书籍id
						int old_num = booksService.findBookNumber(book_id);// 获取书籍表里面的相应id的书籍数量
						int item_num = ite.getBookNum();// 获取购物车提交过来的购买的书籍数量用于修改库存
						int new_num = old_num - item_num;// 得到购买之后的书籍数量
						// int row_item = itemsService.updateBookNumber(book_id,new_num);
						int rows_updateNumber = booksService.updateBookNum(book_id, new_num);
					} else {
						System.out.print("修改书籍库存失败");
					}
				} else {
					System.out.print("删除订单表信息 失败");
				}
			}
			if (itemList == null || itemList.size() <= 0) {
				return "No any ID.中文";
			}
			return "ok";
		}

	}

//购物车功能结束
	@RequestMapping("/createorder")
	@ResponseBody
	public String createOrder(Orders orders) {
		int id = orders.getBook_id();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String str = df.format(new Date());
		orders.setTime(str); // 设置orders 类的time 属性 在配置文件中通过 #{time} 获取了
		int rows = ordersService.createOrder(orders);
		int bookSum = booksService.findBookNumber(id);
		int bookNum = orders.getBook_num();
		int restNum = bookSum - bookNum;
		// 更新书籍库存
		booksService.updateBookNum(id, restNum);

		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	// 删除订单
	@RequestMapping("/deleteOrder")
	@ResponseBody // 这个很重要的，没有他 ，他就返回了一个ok.jsp
	public String deleteOrder(Orders orders) {
		int rows = ordersService.deleteOrder(orders);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}

	}

	// 查询客户所有订单
	@RequestMapping("/findallorders")
	public String findallorders(Integer user_id, Model model) {
		List<Orders> user_orders = ordersService.findallorders(user_id);
		model.addAttribute("user_orders", user_orders);
		return "/user_orders-list";

	}

	@RequestMapping("/updateOrdersNumber")
	@ResponseBody
	public String updateOrdersNumber(Orders orders) {
		int rows = ordersService.updateOrdersNumber(orders);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}

	}

}
