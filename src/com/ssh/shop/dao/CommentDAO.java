package com.ssh.shop.dao;

import java.util.Date;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import com.ssh.shop.po.User;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.CommentRecord;

public class CommentDAO extends HibernateDaoSupport implements ICommentDAO {

	public CommentDAO() {
		System.out.println("create CommentDao");
	}

	@Override
	public void addComment(User user, int book_id, String comment) {
		Book book = (Book) this.getHibernateTemplate().get(Book.class, book_id);
		try {
			CommentRecord commentRecord = new CommentRecord(comment, user, book, new Date());
			this.getHibernateTemplate().merge(commentRecord);
		} catch (Exception e) {
			System.out.println("commentRecorderror");
		}

	}

}
