package com.ssh.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.CommentRecord;
import com.ssh.shop.po.User;
import com.ssh.shop.service.ICommentService;

public class CommentAction {
	private int book_id;
	private Book book;
	private User user;
	private String comment;
	private CommentRecord comments;
	private ICommentService commentService;

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public CommentRecord getComments() {
		return comments;
	}

	public void setComments(CommentRecord comments) {
		this.comments = comments;
	}

	public ICommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public String addComment() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// System.out.println(user);
		// System.out.println(book_id);
		// System.out.println(comment);
		try {
			commentService.addComment(user, book_id, comment);
			ServletActionContext.getRequest().getSession().removeAttribute("bookID");
			ServletActionContext.getRequest().getSession().setAttribute("bookID", book_id);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

}
