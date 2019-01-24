package com.itheima.po;

import java.util.List;

public class Users {
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	private int id;
	private String userName;
	private String password;
	private String phone;
	private String address;
	private String car;// 存储购物车的功能
	public String getCar() {
		return car;
	}
	public void setCar(String car) {
		this.car = car;
	}
	
}
