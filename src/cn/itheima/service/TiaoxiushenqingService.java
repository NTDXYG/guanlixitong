package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.TiaoxiushenqingDao;
import cn.itheima.domain.PageBean;
import cn.itheima.domain.Tiaoxiushenqing;

public class TiaoxiushenqingService {
	public PageBean<Tiaoxiushenqing> findPageBean(int currentPage, int currentCount) throws SQLException {
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Tiaoxiushenqing> tiaoxiushenqingList = dao.findAllTiaoxiushenqingListForPageBean(index,currentCount);
		pageBean.setTiaoxiushenqingList(tiaoxiushenqingList);
		return pageBean;
	}

	public List<Tiaoxiushenqing> findAllTiaoxiushenqing() throws SQLException {
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		return dao.findAllTiaoxiushenqing();
	}

	public Long Count() throws SQLException {
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		return dao.Count();
	}
	
	public void del(String id) throws SQLException {
		// TODO Auto-generated method stub
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		dao.delete(id);
	}


	public void add(Tiaoxiushenqing t) throws SQLException {
		// TODO Auto-generated method stub
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		dao.add(t);
	}

	public void update(Tiaoxiushenqing t) throws SQLException {
		// TODO Auto-generated method stub
		TiaoxiushenqingDao dao = new TiaoxiushenqingDao();
		dao.update(t);
	}
}
