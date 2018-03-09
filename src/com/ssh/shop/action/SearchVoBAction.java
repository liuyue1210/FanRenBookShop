package com.ssh.shop.action;

import org.apache.struts2.ServletActionContext;
import com.ssh.shop.po.PageBean;
import com.ssh.shop.service.SearchBookService;

public class SearchVoBAction {
	private int searchPage;
	private PageBean searchPageBean;
	private SearchBookService searchBookService;
	private int variety;
	private String varietyName;

	public String getVarietyName() {
		return varietyName;
	}

	public void setVarietyName(String varietyName) {
		this.varietyName = varietyName;
	}

	public int getSearchPage() {
		return searchPage;
	}

	public void setSearchPage(int searchPage) {
		this.searchPage = searchPage;
	}

	public PageBean getSearchPageBean() {
		return searchPageBean;
	}

	public void setSearchPageBean(PageBean searchPageBean) {
		this.searchPageBean = searchPageBean;
	}

	public SearchBookService getSearchBookService() {
		return searchBookService;
	}

	public void setSearchBookService(SearchBookService searchBookService) {
		this.searchBookService = searchBookService;
	}

	public int getVariety() {
		return variety;
	}

	public void setVariety(int variety) {
		this.variety = variety;
	}

	public boolean findBookByVariety() {
		ServletActionContext.getRequest().getSession().setAttribute("varietyID", variety);
		ServletActionContext.getRequest().getSession().setAttribute("varietyName", varietyName);
		ServletActionContext.getRequest().getSession().removeAttribute("searchPageBean");
		ServletActionContext.getRequest().getSession().removeAttribute("condition");
		searchPageBean = searchBookService.findBookByVariety(variety, 5, searchPage);// 每一页显示5条记录
		ServletActionContext.getRequest().getSession().setAttribute("searchPageBean", searchPageBean);
		System.out.println("findBookRecom Action executed!");
		return true;
	}

	public String execute() {
		if (findBookByVariety()) {
			return "success";
		} else {
			return "fail";
		}
	}
}
