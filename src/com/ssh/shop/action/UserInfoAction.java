package com.ssh.shop.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;
import com.ssh.shop.service.IUserService;

public class UserInfoAction {
	private User user;
	private String userName;
	private String password;
	private String newpassword;
	private float money;
	private String paypassword;
	private IUserService userService;
	private List<Book> books;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPaypassword() {
		return paypassword;
	}

	public void setPaypassword(String paypassword) {
		this.paypassword = paypassword;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public String userupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user2 = (User) session.getAttribute("user");
		System.out.println(user);
		user2.setSex(user.getSex());
		user2.setPhone(user.getPhone());
		user2.setEmail(user.getEmail());
		System.out.println(user2);
		try {
			userService.updateUser(user2);
			// session.setAttribute("user", user2);
			// user = userService.findBooks(user.getUserID());
			// session.setAttribute("user", user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}

	}

	public String changePassword() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUserPassword());
		if (!password.equals(user.getUserPassword())) {
			return "fail";
		}

		user.setUserPassword(newpassword);

		try {
			userService.updateUser(user);
			// user = userService.findBooks(user.getUserID());
			// session.setAttribute("user", user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public String chargeBalance() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// System.out.println(user.getPayPassword());
		// System.out.println(money);
		if (!paypassword.equals(user.getPayPassword())) {
			return "fail";
		}
		float balance = user.getBalance() + money;
		user.setBalance(balance);
		try {
			userService.updateUser(user);
			// user = userService.findBooks(user.getUserID());
			// session.setAttribute("user", user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	public String showBookShelf() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		// System.out.println("hhh");
		User user = (User) session.getAttribute("user");
		user = userService.findBooks(user.getUserID());
		session.setAttribute("user", user);
		// ActionContext actionContext = ActionContext.getContext();
		// Map session = actionContext.getSession();
		// session.put("allbooks", books);
		return "success";
	}

}
