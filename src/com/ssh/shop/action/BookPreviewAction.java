package com.ssh.shop.action;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.service.IBookPreviewService;

public class BookPreviewAction {
	private IBookPreviewService bookpreviewService = null;
	private int bookid;
	private Book book;

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

	public IBookPreviewService getBookpreviewService() {
		return bookpreviewService;
	}

	public void setBookpreviewService(IBookPreviewService bookpreviewService) {
		this.bookpreviewService = bookpreviewService;
	}

	public String preview() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		book = bookpreviewService.findBook(bookid);
		if (book != null) {
			session.setAttribute("book", book);
			return "success";
		}
		return "fail";
	}
}
