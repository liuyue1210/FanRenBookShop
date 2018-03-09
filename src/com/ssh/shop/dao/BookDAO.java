package com.ssh.shop.dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.Book;

public class BookDAO extends HibernateDaoSupport implements IBookDAO {
	public Book findByID(int id) {
		System.out.println("------execute findByID() method------");
		Book book = (Book) this.getHibernateTemplate().get(Book.class, id);
		return book;
	}
}
