package com.itheima.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.dao.ItemsDao;
import com.itheima.dao.OrdersDao;
import com.itheima.po.Admins;
import com.itheima.po.Items;
import com.itheima.po.Orders;
import com.itheima.service.OrdersService;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {
@Autowired	
private OrdersDao ordersDao;
 
@Autowired	
private ItemsDao itemsDao;
  
@Override
public int createOrder(Orders orders) {
	// TODO Auto-generated method stub
	return this.ordersDao.createOrder(orders);
}
 
@Override  
public int deleteOrder(Integer book_id) {
	// TODO Auto-generated method stub
	return this.ordersDao.deleteOrder(book_id);
}

@Override
public List<Orders> findallorders(Integer user_id) {
	// TODO Auto-generated method stub
	return this.ordersDao.findallorders(user_id);
}

@Override
public int updateOrdersNumber(Orders orders) {
	// TODO Auto-generated method stub
	return this.ordersDao.updateOrdersNumber(orders);
}
@Override  
public int deleteOrder(Orders orders) {
	// TODO Auto-generated method stub
	return this.ordersDao.deleteOrder(orders);
}

@Override//id用户分页实现
public Page<Orders> findAllOrders(Integer page, Integer rows ,Integer user_id) {
	// TODO Auto-generated method stub

	Orders order=new Orders();
	order.setStart((page-1) * rows);	
	order.setRows(rows);
	order.setUser_id(user_id);	
	List<Orders> orders=ordersDao.findAllOrders(order);	
	Integer count =ordersDao.findOrdersCount();	
	Page<Orders> result= new Page<>();
	result.setPage(page);
	result.setRows(orders);
	result.setSize(rows);
	result.setTotal(count);
	return  result;
}

}
