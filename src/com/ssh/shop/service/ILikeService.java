package com.ssh.shop.service;

import com.ssh.shop.po.User;

public interface ILikeService {
	public void addLike(User user, int book_id);
}
