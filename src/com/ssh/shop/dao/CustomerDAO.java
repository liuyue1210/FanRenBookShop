package com.ssh.shop.dao;

import java.util.List;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;

public class CustomerDAO extends HibernateDaoSupport implements ICustomerDAO {
	public CustomerDAO() {
		System.out.println("create CustomerDao");
	}

	/* 登录查询 */
	@Override
	public User findByNameAndPwd(User user) {
		System.out.println("------execute findByNameAndPwd() method------");
		String hql1 = "from User as user where user.userName='" + user.getUserName() + "' and user.userPassword='"
				+ user.getUserPassword() + "'";
		List<User> users = (List<User>) this.getHibernateTemplate().find(hql1);
		if (!users.isEmpty())
			return users.get(0);
		return null;
	}

	public boolean save(User user) {
		System.out.println("------execute save() method------");
		try {
			this.getHibernateTemplate().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public void updateUser(User user) {
		System.out.println("------execute updateUser() method------");
		this.getHibernateTemplate().update(user);
	}

	@Override
	public User findById(int userID) {
		System.out.println("------execute findById() method------");
		return this.getHibernateTemplate().get(User.class, userID);
	}

	@Override
	public void addBookToShelf(User user, Book book) {
		System.out.println("------execute addBookToShelf() method------");
		User user2 = this.getHibernateTemplate().get(User.class, user.getUserID());
		Book book2 = this.getHibernateTemplate().get(Book.class, book.getBookID());
		user2.getBooks().add(book2);
		this.getHibernateTemplate().update(user2);

	}

	@Override
	public List findByHql(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

}
