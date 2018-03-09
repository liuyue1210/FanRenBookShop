package com.ssh.shop.service;

import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.ICommentDAO;
import com.ssh.shop.po.User;

@Transactional
public class CommentService implements ICommentService {
	private ICommentDAO commentDAO;

	public CommentService() {
		System.out.println("create CommentService.");
	}

	public ICommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(ICommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

	@Override
	public void addComment(User user, int book_id, String comment) {
		System.out.println("execute --addComment()-- method.");
		commentDAO.addComment(user, book_id, comment);
	}

}
