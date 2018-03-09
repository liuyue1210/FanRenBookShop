package com.ssh.shop.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.IBookDAO;
import com.ssh.shop.dao.ICustomerDAO;
import com.ssh.shop.dao.IOrderDAO;
import com.ssh.shop.dao.IOrderDetailDAO;
import com.ssh.shop.dao.IShoppingCartDetailDAO;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.Order;
import com.ssh.shop.po.OrderDetail;
import com.ssh.shop.po.User;

@Transactional
public class ShoppingService implements IShoppingService {
	private IBookDAO bookDAO;
	private IOrderDAO orderDAO;
	private IOrderDetailDAO orderDetailDAO;
	private ICustomerDAO userDAO;
	private IShoppingCartDetailDAO detailDAO;

	public IShoppingCartDetailDAO getDetailDAO() {
		return detailDAO;
	}

	public void setDetailDAO(IShoppingCartDetailDAO detailDAO) {
		this.detailDAO = detailDAO;
	}

	public ICustomerDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(ICustomerDAO userDAO) {
		this.userDAO = userDAO;
	}

	public IOrderDetailDAO getOrderDetailDAO() {
		return orderDetailDAO;
	}

	public void setOrderDetailDAO(IOrderDetailDAO orderDetailDAO) {
		this.orderDetailDAO = orderDetailDAO;
	}

	public IOrderDAO getOrderDAO() {
		return orderDAO;
	}

	public void setOrderDAO(IOrderDAO orderDAO) {
		this.orderDAO = orderDAO;
	}

	public IBookDAO getBookDAO() {
		return bookDAO;
	}

	public void setBookDAO(IBookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public Book findById(int bookid) {
		return bookDAO.findByID(bookid);
	}

	/* 购买一本图书 */
	@Override
	public boolean payForOneBook(User user, int bookid) {
		System.out.println("user=" + user);
		User user2 = userDAO.findById(user.getUserID());
		Book book = bookDAO.findByID(bookid);
		System.out.println("book=" + book);
		if(user2.getBooks().contains(book)){
			return true;
		}
		if (user2.getBalance() < book.getPrice()) {
			return false;
		} else {
			Order order = new Order();
			order.setUser(user2);
			order.setDealDate(new Date());
			order.setOrderTotalPrice(book.getPrice());

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setBook(book);

			order.getOrderDetail().add(orderDetail);
			System.out.println("user为：" + user2);
			System.out.println("book为：" + book);

			// 购买成功加入书架
			// userDAO.addBookToShelf(user2,book);
			orderDAO.save(order);

			return true;
		}
	}

	/* 购买多本图书 */
	@Override
	public boolean payManyBooks(User user, int[] choice) {
		System.out.println("user=" + user);
		User user2 = userDAO.findById(user.getUserID());
		ArrayList<Book> books = new ArrayList<Book>();
		float account = 0;
		for (int i = 0; i < choice.length; i++) {
			Book book = detailDAO.findShoppingCartDetailById(choice[i]).getBook();
			if(!user2.getBooks().contains(book)){
				books.add(book);
				account += book.getPrice();
			}
		}
		System.out.println("所有图书为：" + books);
		
		if (user2.getBalance() < account) {
			return false;
		} else {
			Order order = new Order();
			order.setUser(user2);
			order.setDealDate(new Date());
			order.setOrderTotalPrice(account);

			for (int i = 0; i < books.size(); i++) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrder(order);
				orderDetail.setBook(books.get(i));
				order.getOrderDetail().add(orderDetail);
			}
			orderDAO.save(order);
			// 购买成功加入书架,删除购物车
			for (int i = 0; i < books.size(); i++) {
				// userDAO.addBookToShelf(user2,books.get(i));
				detailDAO.delDetail(choice[i]);
			}
			return true;
		}
	}
}
