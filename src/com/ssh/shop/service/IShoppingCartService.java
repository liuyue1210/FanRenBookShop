package com.ssh.shop.service;

import java.util.List;

public interface IShoppingCartService {

	public void add(int bookid);

	public List findByHql();

	public void delete(int bookid);
	
}
