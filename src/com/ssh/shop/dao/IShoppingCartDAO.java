package com.ssh.shop.dao;

import java.util.List;
import com.ssh.shop.po.Shoppingcart;

public interface IShoppingCartDAO {

	List findByHql(String hql);

	Shoppingcart findByUserID(int userID);

}
