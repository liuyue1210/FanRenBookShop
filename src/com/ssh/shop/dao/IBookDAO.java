package com.ssh.shop.dao;

import com.ssh.shop.po.Book;

public interface IBookDAO {
	public Book findByID(int id);
}
