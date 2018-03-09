package com.ssh.shop.dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.ShoppingCartDetail;

public class ShoppingCartDetailDAO extends HibernateDaoSupport implements IShoppingCartDetailDAO {

	@Override
	public ShoppingCartDetail findShoppingCartDetailById(int id) {
		System.out.println("------execute  findShoppingCartDetailById() method------");
		ShoppingCartDetail detail = (ShoppingCartDetail) this.getHibernateTemplate().get(ShoppingCartDetail.class, id);
		return detail;
	}

	@Override
	public void delDetail(int id) {
		ShoppingCartDetail detail = (ShoppingCartDetail) this.getHibernateTemplate().get(ShoppingCartDetail.class, id);
		detail.setBook(null);
		detail.setShoppingcart(null);
		this.getHibernateTemplate().update(detail);
		detail = (ShoppingCartDetail) this.getHibernateTemplate().get(ShoppingCartDetail.class, id);
		System.out.println("detail" + detail);
		this.getHibernateTemplate().delete(detail);
	}

	@Override
	public void addDetail(ShoppingCartDetail shoppingCartDetail) {
		this.getHibernateTemplate().save(shoppingCartDetail);
	}

}
