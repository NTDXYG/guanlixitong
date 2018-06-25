package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import cn.itheima.domain.Kaoqinjilu;
import cn.itheima.utils.C3P0Utils;

public class KaoqinjiluDao {

	public Long Count() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from kaoqinjilu";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
	}

	public List<Kaoqinjilu> findAllKaoqinjiluListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from kaoqinjilu limit ?,?";
		return qr.query(sql, new BeanListHandler<Kaoqinjilu>(Kaoqinjilu.class), index,currentCount);
	}

	public void delete(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from kaoqinjilu where id=?";
		qr.update(sql,id);
	}

	public void add(Kaoqinjilu k) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into kaoqinjilu values(null,?,?,?,?,?,?)";
		qr.update(sql, k.getKaoqinshijian(), k.getLeibie(), k.getStaff_name(), k.getKaoqinshiduan(),k.getShuoming(),k.getJiluren());
	}

	public void update(Kaoqinjilu k) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update kaoqinjilu set kaoqinshijian=?,leibie=?,staff_name=?,kaoqinshiduan=?,shuoming=?,jiluren=? where id=?";
		qr.update(sql, k.getKaoqinshijian(), k.getLeibie(), k.getStaff_name(), k.getKaoqinshiduan(),k.getShuoming(),k.getJiluren(),k.getId());
	
	}

	public List<Kaoqinjilu> findAllKaoqinjilu() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from kaoqinjilu";
		List<Kaoqinjilu> kaoqinjiluList = runner.query(sql, new BeanListHandler<Kaoqinjilu>(Kaoqinjilu.class));
		return kaoqinjiluList;
	}

}
