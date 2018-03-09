package com.ssh.shop.po;

//zjy加两个构造方法
public class LikeRecord implements java.io.Serializable {
	private int likeID; // 点赞ID（数据库自增）
	private User user; // 点赞的用户
	private Book book; // 被点赞的图书

	public LikeRecord() {
		super();
	}

	public LikeRecord(User user, Book book) {
		super();
		this.user = user;
		this.book = book;
	}

	public int getLikeID() {
		return likeID;
	}

	public void setLikeID(int likeID) {
		this.likeID = likeID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

}
