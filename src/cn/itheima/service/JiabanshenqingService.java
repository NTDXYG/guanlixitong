package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.JiabanshenqingDao;
import cn.itheima.domain.Jiabanshenqing;
import cn.itheima.domain.PageBean;

public class JiabanshenqingService {
	public PageBean<Jiabanshenqing> findPageBean(int currentPage, int currentCount) throws SQLException {
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		JiabanshenqingDao dao = new JiabanshenqingDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Jiabanshenqing> jiabanshenqingList = dao.findAllJiabanshenqingListForPageBean(index,currentCount);
		pageBean.setJiabanshenqingList(jiabanshenqingList);
		return pageBean;
	}

	public List<Jiabanshenqing> findAllJiabanshenqing() throws SQLException {
		JiabanshenqingDao dao = new JiabanshenqingDao();
		return dao.findAllJiabanshenqing();
	}

	public Long Count() throws SQLException {
		JiabanshenqingDao dao = new JiabanshenqingDao();
		return dao.Count();
	}
	
	public void del(String id) throws SQLException {
		// TODO Auto-generated method stub
		JiabanshenqingDao dao = new JiabanshenqingDao();
		dao.delete(id);
	}


	public void add(Jiabanshenqing c) throws SQLException {
		// TODO Auto-generated method stub
		JiabanshenqingDao dao = new JiabanshenqingDao();
		dao.add(c);
	}

	public void update(Jiabanshenqing c) throws SQLException {
		// TODO Auto-generated method stub
		JiabanshenqingDao dao = new JiabanshenqingDao();
		dao.update(c);
	}
}
