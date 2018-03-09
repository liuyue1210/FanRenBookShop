package com.ssh.shop.dao;

import java.util.List;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.Shoppingcart;

public class ShoppingCartDAO extends HibernateDaoSupport implements IShoppingCartDAO {

	@Override
	public List findByHql(String hql) {
		return this.getHibernateTemplate().find(hql);
	}

	@Override
	public Shoppingcart findByUserID(int userID) {
		String hql = "from Shoppingcart as shoppingcart where shoppingcart.user.userID=" + userID;
		List<Shoppingcart> shoppingcarts = (List<Shoppingcart>) this.getHibernateTemplate().find(hql);
		if (!shoppingcarts.isEmpty())
			return shoppingcarts.get(0);
		return null;
	}
}
