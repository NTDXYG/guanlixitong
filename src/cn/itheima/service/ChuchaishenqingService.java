package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.ChuchaishenqingDao;
import cn.itheima.domain.Chuchaishenqing;
import cn.itheima.domain.PageBean;

public class ChuchaishenqingService {
	public PageBean<Chuchaishenqing> findPageBean(int currentPage, int currentCount) throws SQLException {
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Chuchaishenqing> chuchaishenqingList = dao.findAllChuchaishenqingListForPageBean(index,currentCount);
		pageBean.setChuchaishenqingList(chuchaishenqingList);
		return pageBean;
	}

	public List<Chuchaishenqing> findAllChuchaishenqing() throws SQLException {
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		return dao.findAllChuchaishenqing();
	}

	public Long Count() throws SQLException {
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		return dao.Count();
	}
	
	public void del(String id) throws SQLException {
		// TODO Auto-generated method stub
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		dao.delete(id);
	}


	public void add(Chuchaishenqing c) throws SQLException {
		// TODO Auto-generated method stub
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		dao.add(c);
	}

	public void update(Chuchaishenqing c) throws SQLException {
		// TODO Auto-generated method stub
		ChuchaishenqingDao dao = new ChuchaishenqingDao();
		dao.update(c);
	}
}
