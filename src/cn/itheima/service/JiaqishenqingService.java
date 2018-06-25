package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.JiaqishenqingDao;
import cn.itheima.domain.Jiaqishenqing;
import cn.itheima.domain.PageBean;

public class JiaqishenqingService {

	public PageBean<Jiaqishenqing> findPageBean(int currentPage, int currentCount) throws SQLException {
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		JiaqishenqingDao dao = new JiaqishenqingDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Jiaqishenqing> jiaqishenqingList = dao.findAllJiaqishenqingListForPageBean(index,currentCount);
		pageBean.setJiaqishenqingList(jiaqishenqingList);
		return pageBean;
	}

	public List<Jiaqishenqing> findAllJiaqishenqing() throws SQLException {
		JiaqishenqingDao dao = new JiaqishenqingDao();
		return dao.findAllJiaqishenqing();
	}

	public Long Count() throws SQLException {
		JiaqishenqingDao dao = new JiaqishenqingDao();
		return dao.Count();
	}
	
	public void del(String id) throws SQLException {
		// TODO Auto-generated method stub
		JiaqishenqingDao dao = new JiaqishenqingDao();
		dao.delete(id);
	}


	public void add(Jiaqishenqing j) throws SQLException {
		// TODO Auto-generated method stub
		JiaqishenqingDao dao = new JiaqishenqingDao();
		dao.add(j);
	}

	public void update(Jiaqishenqing j) throws SQLException {
		// TODO Auto-generated method stub
		JiaqishenqingDao dao = new JiaqishenqingDao();
		dao.update(j);
	}

}
