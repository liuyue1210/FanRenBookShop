package com.ssh.shop.dao;

import com.ssh.shop.po.User;

public interface ICommentDAO {
	public void addComment(User user, int book_id, String comment);
}
