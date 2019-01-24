package com.itheima.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itheima.common.utils.Page;
import com.itheima.dao.BooksDao;
import com.itheima.po.Books;
import com.itheima.service.BooksService;

@Service
@Transactional
public class BooksServiceImpl implements BooksService {
	//注解注入CustomerDao
	@Autowired
	private BooksDao booksDao;
	//查询书籍
	public Books findBooksById(Integer id) {
		return this.booksDao.findBooksById(id);
	}
	//根据书名来查询书籍
		@Override
		public Page<Books> findBooksByBookName(String BookName,Integer page,Integer rows) {
			// TODO Auto-generated method stub
			Books book = new Books();//创建书籍类对象
			book.setStart((page-1) * rows);//设置当前页
			book.setRows(rows);
			List<Books> books= booksDao.findBooksByBookName(BookName);
			Integer count  = booksDao.findBooksCount();
			Page<Books> result = new Page<>();
			result.setPage(page);
			result.setRows(books);
			result.setSize(rows);
			result.setTotal(count);
			return  result;
		}
	//根据id删除书籍
	public int deleteBook(Integer id) {
		return this.booksDao.deleteBook(id);
	}
	@Override
	public int addBook(Books books) {
		// TODO Auto-generated method stub
		return booksDao.addBook(books);
	}
	@Override
	public Page<Books> findAllBooks(Integer page, Integer rows) {
		// TODO Auto-generated method stub
		Books book = new Books();//创建书籍类对象
		book.setStart((page-1) * rows);//设置当前页
		book.setRows(rows);
		List<Books> books= booksDao.findAllBooks(book);
		Integer count  = booksDao.findBooksCount();
		Page<Books> result = new Page<>();
		result.setPage(page);
		result.setRows(books);
		result.setSize(rows);
		result.setTotal(count);
		return  result;
	}
	
	@Override
	public int editBook(Books books) {
		// TODO Auto-generated method stub
		return booksDao.editBook(books);
	}
	@Override
	public int findBooksCount() {
		// TODO Auto-generated method stub
		return booksDao.findBooksCount();
	}
	@Override
	public int findBookNumber(Integer bookId) {
		// TODO Auto-generated method stub
		return booksDao.findBookNumber(bookId);
	}
	@Override
	public int updateBookNum(Integer id ,Integer number) {
		// TODO Auto-generated method stub
		return booksDao.updateBookNum(id,number);
		}
}
