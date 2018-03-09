package com.ssh.shop.action;

import org.apache.struts2.ServletActionContext;

import com.ssh.shop.po.User;
import com.ssh.shop.service.IUserService;

public class UserAction {
	private User loginUser;
	private IUserService userService;

	public User getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(User loginUser) {
		this.loginUser = loginUser;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public String register() {
		if (userService.register(loginUser)) {
			return "success";
		}
		return "fail";
	}

	public String login() {
		if (userService.login(loginUser)) {
			return "success";
		}
		return "fail";
	}

	public String logout() {
		ServletActionContext.getRequest().getSession().removeAttribute("user");
		return "success";
	}

}
