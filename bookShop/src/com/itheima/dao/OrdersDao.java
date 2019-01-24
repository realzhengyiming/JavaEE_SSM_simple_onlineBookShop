package com.itheima.dao;
import java.util.List;

import com.itheima.po.Admins;
import com.itheima.po.Books;
import com.itheima.po.Items;
import com.itheima.po.Users;
import com.itheima.po.Orders;
public interface OrdersDao {
	public int createOrder(Orders orders);//创建订单
	public int deleteOrder(Integer book_id);//删除 客户的订单
	public List<Orders> findallorders(Integer user_id);  //查询所有订单 
	public int  updateOrdersNumber  (Orders orders);//修改订单数量 
	public int deleteOrder(Orders orders);//删除 客户的订单
	public List<Orders> findAllOrders(Orders orders);//id用户分页实现
	public int findOrdersCount();
}
