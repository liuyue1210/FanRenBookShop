package com.ssh.shop.action;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.User;
import com.ssh.shop.service.IShoppingCartService;

public class ShoppingCartAction {
	private int id;
	private int bookid;
	private IShoppingCartService shoppingCartService;
	private List shoppingCartDetails;
	private int[] choice;

	public int[] getChoice() {
		return choice;
	}

	public void setChoice(int[] choice) {
		this.choice = choice;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public IShoppingCartService getShoppingCartService() {
		return shoppingCartService;
	}

	public void setShoppingCartService(IShoppingCartService shoppingCartService) {
		this.shoppingCartService = shoppingCartService;
	}

	public List getShoppingCartDetails() {
		return shoppingCartDetails;
	}

	public void setShoppingCartDetails(List shoppingCartDetails) {
		this.shoppingCartDetails = shoppingCartDetails;
	}

	// 添加图书
	public String add() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		User user = (User) session.getAttribute("user");
		if (user == null)
			return "login";
		shoppingCartService.add(bookid);
		return "success";

	}

	// 查询购物车
	public String search() {
		shoppingCartDetails = shoppingCartService.findByHql();
		return "success";
	}

	// 删除图书
	public String delete() {
		System.out.println("书本的id：" + id);
		shoppingCartService.delete(id);
		return "success";
	}

	// 批量删除图书
	public String batchDelete() {
		System.out.println("choice:" + choice);
		for (int i = 0; i < choice.length; i++) {
			shoppingCartService.delete(choice[i]);
		}
		return "success";
	}
}
