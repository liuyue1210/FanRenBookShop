package com.ssh.shop.service;

import java.util.List;
import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;
import com.ssh.shop.dao.MainBookDao;
import com.ssh.shop.po.Book;
import com.ssh.shop.po.PageBean;

public class SearchBookService implements ISearchBookService{
	private MainBookDao mainBookDao;
	

	public MainBookDao getMainBookDao() {
		return mainBookDao;
	}


	public void setMainBookDao(MainBookDao mainBookDao) {
		this.mainBookDao = mainBookDao;
	}


	public PageBean findBookByCondition(String condition,int pageSize, int page) {
		String hql = "from com.ssh.shop.po.Book as B where B.bookName like '%"+condition
																														+"%' OR B.authorName like '%"+condition
																														+"%' OR B.bookVariety.varietyName like '%"+condition
																														+"%' order by B.sellNum desc,B.likeNum desc,B.price asc";
		int count=mainBookDao.getBookCount(hql);
		
		ServletActionContext.getRequest().getSession().setAttribute("condition", condition);
		
		System.out.println("结果为"+count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		 
		 int length = pageSize; // 每页记录数
		 int currentPage = PageBean.countCurrentPage(page);
		 int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		 List<Book> list = mainBookDao.findDiffBookByPage(hql, offset, length); // 该分页的记录
		 // 把分页信息保存到Bean中
		 PageBean pageBean = new PageBean();
		 pageBean.setPageSize(pageSize);
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setAllRow(count);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setList(list);
		 pageBean.init();
		 return pageBean;
	}
	
	public PageBean findBookByVariety(int varietyID,int pageSize, int page){
		String hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.sellNum desc,B.likeNum desc,B.price asc";
		int count=mainBookDao.getBookCount(hql);
		System.out.println("结果为"+count);
		 int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		 
		 int length = pageSize; // 每页记录数
		 int currentPage = PageBean.countCurrentPage(page);
		 int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		 List<Book> list = mainBookDao.findDiffBookByPage(hql, offset, length); // 该分页的记录
		 // 把分页信息保存到Bean中
		 PageBean pageBean = new PageBean();
		 pageBean.setPageSize(pageSize);
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setAllRow(count);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setList(list);
		 pageBean.init();
		 return pageBean;
	}
	
	//根据用户选择的排序条件产生相对应hql语句
	public String getHql(String condition){
		String hql="";
		int varietyID=(int) ServletActionContext.getRequest().getSession().getAttribute("varietyID");
		System.out.println("现在的类别是"+varietyID);
		if(condition.equals("sellNumU")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.sellNum desc";
		}else if(condition.equals("sellNumD")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.sellNum asc";
		}else if(condition.equals("likeNumU")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.likeNum desc";
		}else if(condition.equals("likeNumD")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.likeNum asc";
		}else if(condition.equals("priceU")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.price desc";
		}else if(condition.equals("priceD")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.price asc";
		}else if(condition.equals("initialSort")){
			hql = "from com.ssh.shop.po.Book as B where B.bookVariety.varietyID="+varietyID+" order by B.sellNum desc, B.likeNum desc, B.price asc";
		}else{
			String[] con=condition.split(" ");
			String con1=con[0];
			String con2=con[1];
			hql = "from com.ssh.shop.po.Book as B where B.bookName like '%"+con1
					+"%' OR B.authorName like '%"+con1
					+"%' OR B.bookVariety.varietyName like '%"+con1
					+"%'";
			if(con2.equals("sellNumU")){
				hql = hql+" order by B.sellNum desc";
			}else if(con2.equals("sellNumD")){
				hql =  hql+" order by B.sellNum asc";
			}else if(con2.equals("likeNumU")){
				hql =  hql+" order by B.likeNum desc";
			}else if(con2.equals("likeNumD")){
				hql =  hql+" order by B.likeNum asc";
			}else if(con2.equals("priceU")){
				hql =  hql+" order by B.price desc";
			}else if(con2.equals("priceD")){
				hql =  hql+" order by B.price asc";
			}else if(con2.equals("initialSort")){
				hql =  hql+" order by B.sellNum desc, B.likeNum desc, B.price asc";
			}
			
		}
		System.out.println("查询代码为"+hql);
		return hql;
	}
	

	public PageBean sortBookByCondition(String condition,int pageSize, int page) {
		String hql=getHql(condition);
		int count=mainBookDao.getBookCount(hql);
		System.out.println("结果为"+count);
		 int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		 
		 int length = pageSize; // 每页记录数
		 int currentPage = PageBean.countCurrentPage(page);
		 int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		 List<Book> list = mainBookDao.findDiffBookByPage(hql, offset, length); // 该分页的记录

		 // 把分页信息保存到Bean中
		 PageBean pageBean = new PageBean();
		 pageBean.setPageSize(pageSize);
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setAllRow(count);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setList(list);
		 pageBean.init();
		 return pageBean;
	}
	
	public Book findBookByID(int bookID){
		String hql="from com.ssh.shop.po.Book as B where B.bookID='"+bookID+"'";
		Book book=new Book();
		book=mainBookDao.findBookByID(hql);
		return book;
	}
	
}