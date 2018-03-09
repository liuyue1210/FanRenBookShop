package com.ssh.shop.dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.OrderDetail;

public class OrderDetailDAO extends HibernateDaoSupport implements IOrderDetailDAO {

	@Override
	public void save(OrderDetail orderDetail) {
		this.getHibernateTemplate().save(orderDetail);
	}
}
