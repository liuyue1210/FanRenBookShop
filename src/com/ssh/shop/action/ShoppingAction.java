package com.ssh.shop.action;

import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.User;
import com.ssh.shop.service.IShoppingService;

public class ShoppingAction {
	private int bookid;
	private int[] choice;
	private IShoppingService shoppingService;
	private Book bookBuyed;
	private String pwd;

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int[] getChoice() {
		return choice;
	}

	public void setChoice(int[] choice) {
		this.choice = choice;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public Book getBookBuyed() {
		return bookBuyed;
	}

	public void setBookBuyed(Book bookBuyed) {
		this.bookBuyed = bookBuyed;
	}

	public IShoppingService getShoppingService() {
		return shoppingService;
	}

	public void setShoppingService(IShoppingService shoppingService) {
		this.shoppingService = shoppingService;
	}

	// 立即购买（显示用，不结算）
	public String buyNow() {
		bookBuyed = shoppingService.findById(bookid);
		return "success";
	}

	// 立即购买（用于支付一本书）
	public String payForBuyNow() {
		System.out.println("pwd=" + pwd);
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if (user == null)
			return "login";
		if (pwd == null || !pwd.equals(user.getPayPassword()))
			return "error";
		if (shoppingService.payForOneBook(user, bookid))
			return "success";

		return "error";
	}

	// 结算多本书
	public String payManyBooks() {
		System.out.println("pwd=" + pwd);
		System.out.println("choice=" + choice);
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("user");
		if (user == null)
			return "login";
		if (pwd == null || !pwd.equals(user.getPayPassword()))
			return "error";
		if (shoppingService.payManyBooks(user, choice))
			return "success";

		return "error";
	}
}
