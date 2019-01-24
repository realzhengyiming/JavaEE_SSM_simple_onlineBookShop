package com.itheima.service;

import java.util.List;

import com.itheima.common.utils.Page;
import com.itheima.po.Books;

public interface BooksService {
	public int addBook(Books books);
	public Books findBooksById(Integer id);/* 根据id查询书籍 */
	public Page<Books> findAllBooks(Integer page, Integer rows);/* 查询所有的书籍 */
	public Page<Books> findBooksByBookName(String BookName, Integer page, Integer rows);// 根据书名来查询书籍
	public int deleteBook(Integer id);// 删除书籍
	public int editBook(Books books);
	public int findBooksCount();
	public int updateBookNum(Integer id, Integer number);// 创建订单后，更改库存数量
	public int findBookNumber(Integer bookId); // 用于获取书籍的现有库存

}
