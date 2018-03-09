package com.ssh.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;
import com.ssh.shop.service.ILikeService;

public class LikeAction {
	private int book_id;
	private Book book;
	private User user;
	private ILikeService likeService;

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ILikeService getLikeService() {
		return likeService;
	}

	public void setLikeService(ILikeService likeService) {
		this.likeService = likeService;
	}

	public String addLike() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		System.out.println(book_id);

		try {
			likeService.addLike(user, book_id);
			ServletActionContext.getRequest().getSession().removeAttribute("bookID");
			ServletActionContext.getRequest().getSession().setAttribute("bookID", book_id);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}

	}
}
