package com.ssh.shop.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.BookVariety;
import com.ssh.shop.po.Notification;

public class MainBookDao extends HibernateDaoSupport implements IMainBookDao {

	//查找所有图书类别
	public List<BookVariety> findBVList(String hql) {
		System.out.println("------execute findBVList(String hql) method------");
		try {
			List<BookVariety> query =  (List<BookVariety>) this.getHibernateTemplate().find(hql);
			return query;
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		}
	}

	// 根据相应的条件查找不同的图书
	public List<Book> findDiffBookByPage(String hql, int offset, int length) {
		System.out.println("------execute findBookByRecom(String hql) method------");
		try {
			System.out.println("start");
			List<Book> query = (List<Book>) this.getHibernateTemplate().find(hql);
			System.out.println("位置是"+offset+" "+length);
			System.out.println("查询结果是"+query.size());
			if(query.size()>offset+length){
				return query.subList(offset, offset+length);
			}else{
				return query.subList(offset, query.size());
			}

		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	//查找销量最高的前十本书
	public List<Book> findTop10Book(String hql){
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		System.out.println("------execute findTop10Book(String hql) method------");
		try {
			System.out.println("start");
			List<Book> query = (List<Book>) this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
			return query;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public Book findBookByID(String hql){
		System.out.println("------execute findBookByID(String hql) method------");
		try {
			System.out.println("start");
			List<Book> query = (List<Book>) this.getHibernateTemplate().find(hql);
			return query.get(0);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	//获得图书的总记录数，为了实现分页做准备
	public int getBookCount(String hql) {
		List<Book> query =(List<Book>) this.getHibernateTemplate().find(hql);
		return query.size();
	}
	
	//获取所有通知
	public Notification getNotification(String hql){
		System.out.println("------execute findNotification(String hql) method------");
		try {
			System.out.println("start");
			List<Notification> query = (List<Notification>) this.getHibernateTemplate().find(hql);
			return query.get(query.size()-1);
		} catch (RuntimeException re) {
			throw re;
		}
	}
}