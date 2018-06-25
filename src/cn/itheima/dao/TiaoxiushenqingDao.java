package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itheima.domain.Tiaoxiushenqing;
import cn.itheima.utils.C3P0Utils;

public class TiaoxiushenqingDao {
	public Long Count() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from tiaoxiushenqing";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
		
	}

	public List<Tiaoxiushenqing> findAllTiaoxiushenqingListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from tiaoxiushenqing limit ?,?";
		return qr.query(sql, new BeanListHandler<Tiaoxiushenqing>(Tiaoxiushenqing.class), index,currentCount);
	}

	public List<Tiaoxiushenqing> findAllTiaoxiushenqing() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from tiaoxiushenqing";
		return runner.query(sql, new BeanListHandler<Tiaoxiushenqing>(Tiaoxiushenqing.class));
	}

	public void delete(String id) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from tiaoxiushenqing where id=?";
		qr.update(sql,id);
	}

	public void add(Tiaoxiushenqing t) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into tiaoxiushenqing values(null,?,?,?,?,?,?)";
		qr.update(sql,t.getStaff_name(),t.getShenqingshijian(),t.getBegin(),t.getEnd(),t.getTiaoxiushichang(),t.getTiaoxiuyuanyin());	
	}

	public void update(Tiaoxiushenqing t) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update tiaoxiushenqing set staff_name=?,shenqingshijian=?,begin=?,end=?,tiaoxiushichang=?,tiaoxiuyuanyin=? where id=?";
		qr.update(sql,t.getStaff_name(),t.getShenqingshijian(),t.getBegin(),t.getEnd(),t.getTiaoxiushichang(),t.getTiaoxiuyuanyin(),t.getId());
	}
}
