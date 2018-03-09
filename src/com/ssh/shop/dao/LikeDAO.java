package com.ssh.shop.dao;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.LikeRecord;
import com.ssh.shop.po.User;

public class LikeDAO extends HibernateDaoSupport implements ILikeDAO {

	@Override
	public void addLike(User user, int book_id) {
		Book book = (Book) this.getHibernateTemplate().get(Book.class, book_id);
		try {
			LikeRecord like = new LikeRecord(user, book);
			this.getHibernateTemplate().merge(like);
		} catch (Exception e) {
			System.out.println("likeRecorderror");
			e.printStackTrace();
		}

	}

}
