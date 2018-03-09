package com.ssh.shop.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;
import com.ssh.shop.service.IBookService;

public class BookAction {
	private IBookService bookService = null;
	private int bookid;
	private Book book;
	private String fileName;
	private InputStream inputStream;

	public IBookService getBookService() {
		return bookService;
	}

	public void setBookService(IBookService bookService) {
		this.bookService = bookService;
	}

	public String getFileName() {
		try {
			book = bookService.findBook(bookid);
			String path = book.getBookPath();
			fileName = path.substring(path.lastIndexOf("/") + 1);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String preview() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		book = bookService.findBook(bookid);
		if (book != null) {
			session.setAttribute("book", book);
			return "success";
		}
		return "fail";
	}

	public String download() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		book = bookService.findBook(bookid);
		String path = book.getBookPath();
		File file = new File(path);
		try {
			inputStream = new FileInputStream(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "success";
	}
}
