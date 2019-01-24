package com.itheima.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.dao.ItemsDao;
import com.itheima.po.Items;
import com.itheima.service.ItemsService;
@Service
@Transactional
public class ItemsServiceImpl implements ItemsService{
	@Autowired	
	private ItemsDao itemsDao;
	@Override
	public int intoOrder(Items items) {
		// TODO Auto-generated method stub
		return this.itemsDao.intoOrder(items);
	}

	@Override
	public List<Items> getCarByUser(String userName) {
		
		return (List<Items>)this.itemsDao.getCarByUser(userName);
	}

	@Override
	public int deleteCar(Integer id) {
		// TODO Auto-generated method stub
		return this.itemsDao.deleteCar(id);
	}

	@Override
	public int deleteItems(Integer id) {
		// TODO Auto-generated method stub
		return itemsDao.deleteCar(id);
	}
	
	
}
