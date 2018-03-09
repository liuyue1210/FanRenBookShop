package com.ssh.shop.service;

import java.util.List;
import com.ssh.shop.po.User;

//1.14郑佳颖添加update
public interface IUserService {
	public boolean login(User transientInstance);

	public boolean register(User transientInstance);

	public void updateUser(User user);

	public User findBooks(int userId);
}
