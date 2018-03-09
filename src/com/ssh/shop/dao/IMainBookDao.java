package com.ssh.shop.dao;

import java.util.List;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.BookVariety;
import com.ssh.shop.po.Notification;

public interface IMainBookDao {

	// 查找所有图书类别
	public List<BookVariety> findBVList(String hql);

	// 查找老板推荐的书目
	public List<Book> findDiffBookByPage(String hql, int offset, int length);

	// 获得图书的总记录数，为了实现分页做准备
	public int getBookCount(String hql);

	// 查找销量最高的前十本书
	public List<Book> findTop10Book(String hql);
	
	public Notification getNotification(String hql);

}
