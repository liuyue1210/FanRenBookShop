package com.ssh.shop.dao;

import com.ssh.shop.po.User;

public interface ILikeDAO {
	public void addLike(User user, int book_id);
}
