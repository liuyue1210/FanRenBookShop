package com.ssh.shop.service;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.ICustomerDAO;
import com.ssh.shop.po.User;

@Transactional
public class UserService implements IUserService {
	private ICustomerDAO customerDAO;

	public UserService() {
		System.out.println("create UserService.");

	}

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		System.out.println("--setCustomerDAO--");
		this.customerDAO = customerDAO;
	}

	public boolean login(User user) {
		System.out.println("execute --login()-- method.");
		User user2 = customerDAO.findByNameAndPwd(user);
		if (user2 != null) {
			ServletActionContext.getRequest().getSession().setAttribute("user", user2);
			return true;
		}
		return false;
	}

	public boolean register(User user) {
		System.out.println("execute --register()-- method.");
		if (customerDAO.save(user)) {
			return true;
		}
		return false;
	}

	@Override
	public void updateUser(User user) {
		System.out.println("execute --update()-- method.");
		this.customerDAO.updateUser(user);
		User user2 = customerDAO.findById(user.getUserID());
		ServletActionContext.getRequest().getSession().setAttribute("user", user2);
	}

	@Override
	public User findBooks(int userId) {
		return customerDAO.findById(userId);
	}

}
