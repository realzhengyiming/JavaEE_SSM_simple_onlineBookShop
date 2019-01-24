package com.itheima.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itheima.common.utils.Page;
import com.itheima.po.Books;
import com.itheima.po.Users;
import com.itheima.service.BooksService;

import net.sf.json.JSONObject;

@Controller
public class BooksController {
	@Autowired
	private BooksService booksService;

	/*
	 * 添加书籍模块
	 */

	// 添加书籍
	@RequestMapping("/insertBooksPage")
	public String insertBooks(Books books, HttpSession session) {
		/* Books books = (Books) session.getAttribute("Books_session"); */
		// 返回客户信息展示页面
		return "admin/books/books-add";
	}

	/**
	 * 添加图书信息
	 */

	@RequestMapping(value = "/addBook")
	public String addBook(HttpServletRequest request, Books books, MultipartFile pictureFile) throws Exception {
		// 使用UUID给图片重命名，并去掉四个“-”
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		// 获取文件的扩展名
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		// 设置图片上传路径
		String url = request.getSession().getServletContext().getRealPath("/upload");
		// 以绝对路径保存重名命后的图片
		pictureFile.transferTo(new File(url + "/" + name + "." + ext));
		// 把图片存储路径保存到数据库
		books.setPhoto("upload/" + name + "." + ext);
		booksService.addBook(books);
		// 重定向到查询所有用户的Controller，测试图片回显
		return "redirect:/findAllBooks";
	}

	/*
	 * 删除书籍
	 */
	@RequestMapping("/deleteBook")
	@ResponseBody
	public String deleteBook(Integer id) {
		int rows = booksService.deleteBook(id);
		if (rows > 0) {
			return "ok";
		} else {
			return "fail";
		}
	}

	@RequestMapping("batchDeletesBooks")
	@ResponseBody
	public void batchDeletes(HttpServletRequest request, HttpServletResponse response) {
		String items = request.getParameter("delitems");
		System.out.println(items);
		String[] strs = items.split(",");

		for (int i = 0; i < strs.length; i++) {
			try {
				int a = Integer.parseInt(strs[i]);
				booksService.deleteBook(a);
			} catch (Exception e) {
			}
		}
	}

	/*
	 * 修改书籍信息
	 */
	@RequestMapping("/editBookPage")
	public String editBookPage(Integer id, Model model) {
		// 返回客户信息展示页面
		Books books = booksService.findBooksById(id);
		model.addAttribute("books", books);
		return "admin/books/books-edit";
	}

	@RequestMapping(value = "/editBook")
	public String editBook(HttpServletRequest request, Books books, MultipartFile pictureFile, String photo)
			throws Exception {
		if (pictureFile.getSize() > 0) {
			// 使用UUID给图片重命名，并去掉四个“-”
			String name = UUID.randomUUID().toString().replaceAll("-", "");
			// 获取文件的扩展名
			String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
			// 设置图片上传路径
			String url = request.getSession().getServletContext().getRealPath("/upload");
			System.out.println(url);
			// 以绝对路径保存重名命后的图片
			pictureFile.transferTo(new File(url + "/" + name + "." + ext));
			// 把图片存储路径保存到数据库
			books.setPhoto("upload/" + name + "." + ext);
		} else {
			books.setPhoto(photo);
		}
		booksService.editBook(books);
		// 重定向到查询所有用户的Controller，测试图片回显
		return "redirect:/findAllBooks";
	}

	/*
	 * 查询所有的书籍
	 */
	// 查询所有的书籍
	@RequestMapping(value = "findAllBooks")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "9") Integer rows,
			Model model) {
		// 条件查询所有客户
		Page<Books> books = booksService.findAllBooks(page, rows);
		int num = booksService.findBooksCount();
		System.out.print(num);
		int rank_id = page * 9 - 8;
		model.addAttribute("rank_id", rank_id);
		model.addAttribute("page", books);
		model.addAttribute("num", num);
		return "admin/books/books-list";
	}

	// 根据id查询书籍
	@RequestMapping("/findBooksById")
	public String findBookssById(Integer id, Model model) {
		Books books = booksService.findBooksById(id);
		model.addAttribute("books", books);
		// 返回客户信息展示页面
		return "admin/books/books-list";
	}

	// 根据书名查询书籍
	@RequestMapping("/findBooksByBookName")
	public String findBooksByBookName(String bookName, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "9") Integer rows, Model model) {

		Page<Books> book = booksService.findBooksByBookName(bookName, page, rows);
		/* Integer num = booksService. */
		model.addAttribute("page1", book);
		// 返回客户信息展示页面
		return "admin/books/books-listByName";
	}

	/* 前台根据书名来查询 */
	@RequestMapping("/search") // 模糊查询,这儿是查询书本，按书本的名字模糊查询
	public String search(String bookName, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer rows, Model model) {
		// 通过账号和密码查询用户
		Page<Books> book = booksService.findBooksByBookName(bookName, page, rows);
		if (book.getSize() > 0) {
			model.addAttribute("book", book); // 返回一个列表，然后结果页进行显示
		} else {
			model.addAttribute("resultState", "未找到你想要的书本,请检查输入或下次再来看看😀"); // 返回一个列表，然后结果页进行显示

		}
		return "index/book/searchResult";
	}

	/* 前台显示书籍详情 */
	@RequestMapping("/bookDetail")
	public String bookDetail(Integer id, Model model) { // 书本详情购买页查到了这本书，然后显示过去就可以了
		Books book = booksService.findBooksById(id);
		model.addAttribute("book", book);
		System.out.println(book);
		return "index/book/bookDetail";
	}

}
