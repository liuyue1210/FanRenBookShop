package com.ssh.shop.service;

import java.io.IOException;
import com.ssh.shop.po.Book;

public interface IBookService {
	public Book findBook(int id) throws IOException;
}
