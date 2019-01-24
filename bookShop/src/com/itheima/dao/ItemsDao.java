package com.itheima.dao;

import java.util.List;

import com.itheima.po.Items;

public interface ItemsDao {
	public int intoOrder(Items items);//添加购物车
	public List<Items> getCarByUser(String userName);
	public int deleteCar(Integer id);
	public int updateBookNumber(Integer id,Integer number);//用户购买之后更新库存
}
