package cn.itheima.service;

import java.sql.SQLException;
import java.util.List;

import cn.itheima.dao.KaoqinjiluDao;
import cn.itheima.domain.Kaoqinjilu;
import cn.itheima.domain.PageBean;

public class KaoqinjiluService {

	public PageBean<Kaoqinjilu> findPageBean(int currentPage, int currentCount) throws SQLException {
		PageBean pageBean = new PageBean(); 
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		KaoqinjiluDao dao = new KaoqinjiluDao();
		int totalCount = dao.Count().intValue();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
		pageBean.setTotalPage(totalPage);
		int index = (currentPage-1)*currentCount;
		List<Kaoqinjilu> kaoqinjiluList = dao.findAllKaoqinjiluListForPageBean(index,currentCount);
		pageBean.setKaoqinjiluList(kaoqinjiluList);
		return pageBean;
	}

	public List<Kaoqinjilu> findAllKaoqinjilu() throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		return dao.findAllKaoqinjilu();
	}

	public Long Count() throws SQLException {
		KaoqinjiluDao dao = new KaoqinjiluDao();
		return dao.Count();
	}
	
/*	public void add(String name) throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		dao.add(name);
	}*/

	public void del(String id) throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		dao.delete(id);
	}

	public void add(Kaoqinjilu k) throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		dao.add(k);
	}

	public void update(Kaoqinjilu k) throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		dao.update(k);
	}

/*	public void update(String id, String name) throws SQLException {
		// TODO Auto-generated method stub
		KaoqinjiluDao dao = new KaoqinjiluDao();
		dao.update(id,name);
	}*/
}
