package com.ssh.shop.dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.ssh.shop.po.Order;

public class OrderDAO extends HibernateDaoSupport implements IOrderDAO {

	@Override
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}
}
