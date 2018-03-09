package com.ssh.shop.dao;

import com.ssh.shop.po.ShoppingCartDetail;

public interface IShoppingCartDetailDAO {

	ShoppingCartDetail findShoppingCartDetailById(int id);

	void delDetail(int id);

	void addDetail(ShoppingCartDetail shoppingCartDetail);

}
