package com.ssh.shop.action;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.BookVariety;
import com.ssh.shop.po.Notification;
import com.ssh.shop.po.PageBean;
import com.ssh.shop.service.ShowMainService;

public class ShowMainAction {
	private List<BookVariety> BVList; // 书的所有种类
	private List<Book> bookSelledList; // 找到销量排行前10的书
	private Notification notification; // 找到最新通知
	private ShowMainService showMainService;
	private int mainPage;
	private PageBean mainPageBean;

	
	public Notification getNotification() {
		return notification;
	}

	public void setNotification(Notification notification) {
		this.notification = notification;
	}

	public List<Book> getBookSelledList() {
		return bookSelledList;
	}

	public void setBookSelledList(List<Book> bookSelledList) {
		this.bookSelledList = bookSelledList;
	}

	public ShowMainService getShowMainService() {
		return showMainService;
	}

	public void setShowMainService(ShowMainService showMainService) {
		this.showMainService = showMainService;
	}

	public List<BookVariety> getBVList() {
		return BVList;
	}

	public void setBVList(List<BookVariety> bVList) {
		BVList = bVList;
	}

	public int getMainPage() {
		return mainPage;
	}

	public void setMainPage(int mainPage) {
		this.mainPage = mainPage;
	}

	public PageBean getMainPageBean() {
		return mainPageBean;
	}

	public void setMainPageBean(PageBean mainPageBean) {
		this.mainPageBean = mainPageBean;
	}

	public boolean findBookVariety() {
		BVList = showMainService.findBVByHql();
		ServletActionContext.getRequest().getSession().setAttribute("BVList", BVList);
		System.out.println("findBookVariety Action executed!");
		return true;
	}

	public boolean findBookRecomForPage() {
		mainPageBean = showMainService.findBookRecomByHql(8, mainPage);// 每一页显示8条记录
		ServletActionContext.getRequest().getSession().setAttribute("mainPageBean", mainPageBean);
		System.out.println("findBookRecom Action executed!");
		return true;
	}

	public boolean findBookSelled() {
		bookSelledList = showMainService.findBookSelledByHql();
		System.out.println("findBookSelled Action executed!");
		return true;
	}
	
	public boolean findNotification() {
		notification = showMainService.findNotificationByHql();
		ServletActionContext.getRequest().getSession().setAttribute("notification", notification);
		System.out.println("findNotification Action executed!");
		return true;
	}

	public String execute() {
		if (findBookVariety() && findBookRecomForPage() && findBookSelled()&&findNotification()) {
			ServletActionContext.getRequest().setAttribute("count", "1");
			return "success";
		} else {
			return "fail";
		}
	}

}