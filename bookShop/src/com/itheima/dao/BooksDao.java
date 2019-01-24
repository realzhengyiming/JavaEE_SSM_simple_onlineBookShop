package com.itheima.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.itheima.po.Books;

public interface BooksDao {
	//安装id来查询客户
	public Books findBooksById(Integer id);
	//查询所有 
	/*public List<Books> findAllBooks(List<Books> books);*/
	public List<Books> findAllBooks(Books books);
	//根据名字来查询书籍
	public List<Books> findBooksByBookName(String BookName);
	//查询书籍的总数量
	public int findBooksCount();
	//根据id删除书籍
	public int deleteBook(Integer id);
	public int addBook(Books books);
	public int editBook(Books books);
	//获取相应书籍的库存
	public int findBookNumber(Integer id);
	public int updateBookNum( @Param("id")  Integer id ,@Param("restNum") Integer number);//创建订单后，更改库存数量
}
