package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.ShujuzidianDao;
import cn.itheima.domain.PageBean;
import cn.itheima.domain.Shujuzidian;

public class ShujuzidianService {

	public PageBean<Shujuzidian> findPageBean(int currentPage, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		ShujuzidianDao dao = new ShujuzidianDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Shujuzidian> shujuzidianList = dao.findShujuzidianListForPageBean(index,currentCount);
		pageBean.setShujuzidianList(shujuzidianList);
		return pageBean;
	}

	public List<Shujuzidian> findAllShujuzidian() throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		return dao.findAllShujuzidian();
	}

	public Long Count() throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		return dao.Count();
	}

	public List<Shujuzidian> findShujuzidianByName(String name) throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		return dao.findShujuzidianByName(name);
	}

	public Long CountByName(String name) throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		return dao.CountByName(name);
	}

	public PageBean<Shujuzidian> findPageBean(String name, int currentPage, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		ShujuzidianDao dao = new ShujuzidianDao();
		int totalCount = dao.CountByName(name).intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Shujuzidian> shujuzidianList = dao.findShujuzidianListForPageBean(name,index,currentCount);
		pageBean.setShujuzidianList(shujuzidianList);
		return pageBean;
	}

	public void add(String name, String value) throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		dao.add(name,value);
	}

	public void del(String name, String value) throws SQLException {
		ShujuzidianDao dao = new ShujuzidianDao();
		dao.del(name,value);
	}

	public void update(String name, String value,String value_back) throws SQLException {
		// TODO Auto-generated method stub
		ShujuzidianDao dao = new ShujuzidianDao();
		dao.update(name,value,value_back);
	}

}
