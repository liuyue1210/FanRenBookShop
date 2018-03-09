package com.ssh.shop.service;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.MainBookDao;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.BookVariety;
import com.ssh.shop.po.Notification;
import com.ssh.shop.po.PageBean;


public class ShowMainService implements IShowMainService{
	private MainBookDao mainBookDao;

	public MainBookDao getMainBookDao() {
		return mainBookDao;
	}

	public void setMainBookDao(MainBookDao mainBookDao) {
		this.mainBookDao = mainBookDao;
	}
	
	public List<BookVariety> findBVByHql(){
		String hql = "from com.ssh.shop.po.BookVariety";
		List<BookVariety> list = mainBookDao.findBVList(hql);
		return list;
	}
	
	public PageBean findBookRecomByHql(int pageSize, int page){
		String hql = "from com.ssh.shop.po.Book as B where B.recommendFlag='1' order by B.sellNum desc,B.likeNum desc,B.price asc";
		int count=mainBookDao.getBookCount(hql);
		
		 int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		 
		 int length = pageSize; // 每页记录数
		 int currentPage = PageBean.countCurrentPage(page);
		 int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		 List<Book> list = mainBookDao.findDiffBookByPage(hql, offset, length); // 该分页的记录
		 // 把分页信息保存到Bean中
		 PageBean pageBean = new PageBean();
		 pageBean.setPageSize(pageSize);
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setAllRow(count);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setList(list);
		 pageBean.init();
		 return pageBean;
	}
	
	public List<Book> findBookSelledByHql(){
		String hql = "from com.ssh.shop.po.Book as B order by B.sellNum desc";
		List<Book> list = mainBookDao.findTop10Book(hql);
		return list;
	}
	
	public Notification findNotificationByHql(){
		String hql = "from com.ssh.shop.po.Notification";
		Notification list = mainBookDao.getNotification(hql);
		return list;
	}
	
	
}