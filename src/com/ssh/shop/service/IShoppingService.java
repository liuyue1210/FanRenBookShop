package com.ssh.shop.service;

import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;

public interface IShoppingService {

	Book findById(int bookid);

	boolean payForOneBook(User user, int bookid);

	boolean payManyBooks(User user, int[] choice);
	
}
