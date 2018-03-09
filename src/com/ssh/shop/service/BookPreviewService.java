package com.ssh.shop.service;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.IBookDAO;
import com.ssh.shop.po.Book;

@Transactional
public class BookPreviewService implements IBookPreviewService {
	private IBookDAO bookpreviewDAO;

	public IBookDAO getBookpreviewDAO() {
		return bookpreviewDAO;
	}

	public void setBookpreviewDAO(IBookDAO bookpreviewDAO) {
		this.bookpreviewDAO = bookpreviewDAO;
	}

	@Override
	public Book findBook(int id) throws IOException {
		Book book = new Book();
		book = bookpreviewDAO.findByID(id);
		String address = book.getBookPath();
		// File file = new File(address);
		// FileReader fr=new FileReader(file);
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(address), "utf-16"));
		String str = "";
		for (int i = 0; i < 20; i++) {
			str += br.readLine();
		}
		System.out.println(str);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("text", str);
		br.close();
		return book;
	}
}
