package com.itheima.po;

public class Orders {
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orders(int id, int book_id, int user_id, int book_num) {
		super();
		this.id = id;
		this.book_id = book_id;
		this.user_id = user_id;
		this.book_num = book_num;

	}

	private double price;

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	private int book_num;
	private int id;
	private int book_id;
	private int user_id;

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	private String book_name;
	private String time;
	private Integer start;

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	private Integer rows;

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}
