package com.ssh.shop.service;

import com.ssh.shop.po.Book;
import com.ssh.shop.po.PageBean;

public interface ISearchBookService {
	public PageBean findBookByCondition(String condition,int pageSize, int currentPage);
	public PageBean findBookByVariety(int varietyID,int pageSize, int currentPage);
	public PageBean sortBookByCondition(String condition,int pageSize, int currentPage);
	public Book findBookByID(int bookID);
}
