package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itheima.domain.Jiaqishenqing;
import cn.itheima.utils.C3P0Utils;

public class JiaqishenqingDao {

	public Long Count() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from jiaqishenqing";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
	}

	public List<Jiaqishenqing> findAllJiaqishenqingListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from jiaqishenqing limit ?,?";
		return qr.query(sql, new BeanListHandler<Jiaqishenqing>(Jiaqishenqing.class), index,currentCount);
	
	}

	public List<Jiaqishenqing> findAllJiaqishenqing() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from jiaqishenqing";
		return runner.query(sql, new BeanListHandler<Jiaqishenqing>(Jiaqishenqing.class));
	}

	public void delete(String id) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from jiaqishenqing where id=?";
		qr.update(sql,id);
	}

	public void add(Jiaqishenqing j) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into jiaqishenqing values(null,?,?,?,?,?,?)";
		qr.update(sql,j.getStaff_name(), j.getKaishishijian(), j.getJieshushijian(),j.getShichang(),j.getJiaqileixing(),j.getYuanyin());
	}

	public void update(Jiaqishenqing j) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update jiaqishenqing set staff_name=?,kaishishijian=?,jieshushijian=?,shichang=?,jiaqileixing=?,yuanyin=? where id=?";
		qr.update(sql,j.getStaff_name(), j.getKaishishijian(), j.getJieshushijian(),j.getShichang(),j.getJiaqileixing(),j.getYuanyin(),j.getId());
	
	}

}
