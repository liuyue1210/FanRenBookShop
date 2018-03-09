package com.ssh.shop.action;

import org.apache.struts2.ServletActionContext;

import com.ssh.shop.po.Book;
import com.ssh.shop.po.PageBean;
import com.ssh.shop.service.SearchBookService;

public class SearchBookAction {
	private int searchPage;
    private PageBean searchPageBean;
    private SearchBookService searchBookService;
    private String condition;
    private int bookID;
    private Book book;

    
    
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
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

	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	    
	public SearchBookService getSearchBookService() {
		return searchBookService;
	}
	public void setSearchBookService(SearchBookService searchBookService) {
		this.searchBookService = searchBookService;
	}
	public boolean findBookByCondition(){
		ServletActionContext.getRequest().getSession().removeAttribute("searchPageBean");
		searchPageBean=searchBookService.findBookByCondition(condition, 10, searchPage);//每一页显示5条记录
		ServletActionContext.getRequest().getSession().setAttribute("searchPageBean", searchPageBean);
		System.out.println("findBookRecom Action executed!");
		return true;
	}
	
	public String sortBook(){
		System.out.println("根据"+condition+"排序");
		ServletActionContext.getRequest().getSession().removeAttribute("searchPageBean");
		if(ServletActionContext.getRequest().getSession().getAttribute("condition")!=null){
			condition=(String) ServletActionContext.getRequest().getSession().getAttribute("condition")+" "+condition;
		}
		System.out.println("真的条件"+condition);
		searchPageBean=searchBookService.sortBookByCondition(condition, 5, searchPage);//每一页显示5条记录
		ServletActionContext.getRequest().getSession().setAttribute("searchPageBean", searchPageBean);
		System.out.println("sortBook Action executed!");
		return "success";
	}
	
	public String findBookDetail(){
		if(bookID==0){
			bookID=(int) ServletActionContext.getRequest().getSession().getAttribute("bookID");
		}
		book=searchBookService.findBookByID(bookID);
		ServletActionContext.getRequest().getSession().setAttribute("book", book);
		return "success";
	}
	public String execute(){
		if(findBookByCondition()){
			return "success";
		}else{
			return "fail";
		}
	}
}