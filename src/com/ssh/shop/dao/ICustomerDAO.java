package com.ssh.shop.dao;

import java.util.List;

import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;

public interface ICustomerDAO {

	public boolean save(User transientInstance);

	public void updateUser(User user);

	public User findById(int userID);

	public User findByNameAndPwd(User user);

	public void addBookToShelf(User user, Book book);

	List findByHql(String hql);
}
