package com.ssh.shop.service;

import java.util.List;
import java.util.Set;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.IBookDAO;
import com.ssh.shop.dao.ICustomerDAO;
import com.ssh.shop.dao.IShoppingCartDAO;
import com.ssh.shop.dao.IShoppingCartDetailDAO;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.ShoppingCartDetail;
import com.ssh.shop.po.Shoppingcart;
import com.ssh.shop.po.User;

@Transactional
public class ShoppingCartService implements IShoppingCartService {
	private IBookDAO bookDAO;
	private ICustomerDAO userDAO;
	private IShoppingCartDetailDAO detailDAO;

	private IShoppingCartDAO shoppingCartDAO;

	public IShoppingCartDetailDAO getDetailDAO() {
		return detailDAO;
	}

	public void setDetailDAO(IShoppingCartDetailDAO detailDAO) {
		this.detailDAO = detailDAO;
	}

	public IBookDAO getBookDAO() {
		return bookDAO;
	}

	public void setBookDAO(IBookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public ICustomerDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(ICustomerDAO userDAO) {
		this.userDAO = userDAO;
	}

	public IShoppingCartDAO getShoppingCartDAO() {
		return shoppingCartDAO;
	}

	public void setShoppingCartDAO(IShoppingCartDAO shoppingCartDAO) {
		this.shoppingCartDAO = shoppingCartDAO;
	}

	/* 购物车中添加图书 */
	@Override
	public void add(int bookid) {
		/* 根据ID找到图书 */
		Book book = bookDAO.findByID(bookid);

		/* 获得存储在session中的user对象 */
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		Shoppingcart shoppingCart = shoppingCartDAO.findByUserID(user.getUserID());

		/* 向购物车中添加图书 */
		Set<ShoppingCartDetail> details = shoppingCart.getShoppingCartDetail();
		boolean isNewBook = true;
		for (ShoppingCartDetail detail : details) {
			if (detail.getBook().getBookID() == book.getBookID()) {
				isNewBook = false;
				break;
			}
		}
		if (isNewBook) {
			ShoppingCartDetail shoppingCartDetail = new ShoppingCartDetail();
			shoppingCartDetail.setBook(book);
			shoppingCartDetail.setShoppingcart(shoppingCart);
			detailDAO.addDetail(shoppingCartDetail);
			/* 更新 */
			User user2 = userDAO.findById(user.getUserID());
			ServletActionContext.getRequest().getSession().setAttribute("user", user2);
		}
	}

	/* 查询购物车 */
	@Override
	public List findByHql() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		String hql = "from ShoppingCartDetail as shoppingCartDetail where shoppingCartDetail.shoppingcart.user.userID="
				+ user.getUserID();
		List list = shoppingCartDAO.findByHql(hql);
		return list;
	}

	/* 删除购物车中图书 */
	@Override
	public void delete(int id) {
		/*
		 * User user = (User)
		 * ServletActionContext.getRequest().getSession().getAttribute("user"); // user
		 * = userDAO.findById(user.getUserID()); Shoppingcart shoppingCart =
		 * shoppingCartDAO.findByUserID(user.getUserID()); // Shoppingcart shoppingCart
		 * = user.getShoppingcart(); System.out.println("shoppingcart:" + shoppingCart);
		 * Set<ShoppingCartDetail> details = shoppingCart.getShoppingCartDetail();
		 * details.remove(delDetail); shoppingCart.setShoppingCartDetail(details);
		 * shoppingCartDAO.updateShoppingCartDAO(shoppingCart); //
		 * user.setShoppingcart(shoppingCart); // userDAO.updateUser(user);
		 */
		detailDAO.delDetail(id);

		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		User user2 = userDAO.findById(user.getUserID());
		ServletActionContext.getRequest().getSession().setAttribute("user", user2);
		System.out.println("执行service");
	}

}
