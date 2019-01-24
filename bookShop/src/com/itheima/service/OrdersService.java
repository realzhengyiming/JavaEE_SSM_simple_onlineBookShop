package com.itheima.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.po.Items;
import com.itheima.po.Orders;

public interface OrdersService {
	public int createOrder(Orders orders);
	public int deleteOrder(Integer book_id);//删除 客户的订单
	public List<Orders> findallorders(Integer user_id); 
	public int  updateOrdersNumber  (Orders orders);//修改订单数量 
	public Page<Orders> findAllOrders(Integer page,Integer rows,Integer user_id);//根据用户id分页
	public int deleteOrder(Orders orders);//删除 客户的订单
}
