package com.ssh.shop.service;

import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.ILikeDAO;
import com.ssh.shop.po.User;

@Transactional
public class LikeService implements ILikeService {
	private ILikeDAO likeDAO;

	public LikeService() {
		System.out.println("create LikeService.");
	}

	public ILikeDAO getLikeDAO() {
		return likeDAO;
	}

	public void setLikeDAO(ILikeDAO likeDAO) {
		this.likeDAO = likeDAO;
	}

	@Override
	public void addLike(User user, int book_id) {
		System.out.println("execute --addLike()-- method.");
		likeDAO.addLike(user, book_id);
	}

}
