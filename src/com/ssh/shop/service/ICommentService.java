package com.ssh.shop.service;

import com.ssh.shop.po.User;

public interface ICommentService {

	public void addComment(User user, int book_id, String comment);

}
