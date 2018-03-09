package com.ssh.shop.service;

import java.util.List;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.BookVariety;
import com.ssh.shop.po.Notification;
import com.ssh.shop.po.PageBean;

public interface IShowMainService {
	public List<BookVariety> findBVByHql();

	public PageBean findBookRecomByHql(int pageSize, int currentPage);

	public List<Book> findBookSelledByHql();
	
	public Notification findNotificationByHql();
}
