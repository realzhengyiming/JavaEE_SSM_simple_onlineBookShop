package com.itheima.service;

import java.util.List;

import com.itheima.po.Items;

public interface ItemsService {
	public int intoOrder(Items items);//添加购物车
	public List<Items> getCarByUser(String userName);//通过用户名字
	public int deleteCar(Integer id);
	//删除订单表的信息
	public int deleteItems(Integer id);
}
