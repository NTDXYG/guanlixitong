package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itheima.domain.Chuchaishenqing;
import cn.itheima.utils.C3P0Utils;

public class ChuchaishenqingDao {

	public Long Count() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from chuchaishenqing";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
		
	}

	public List<Chuchaishenqing> findAllChuchaishenqingListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from chuchaishenqing limit ?,?";
		return qr.query(sql, new BeanListHandler<Chuchaishenqing>(Chuchaishenqing.class), index,currentCount);
	}

	public List<Chuchaishenqing> findAllChuchaishenqing() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from chuchaishenqing";
		return runner.query(sql, new BeanListHandler<Chuchaishenqing>(Chuchaishenqing.class));
	}

	public void delete(String id) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from chuchaishenqing where id=?";
		qr.update(sql,id);
	}

	public void add(Chuchaishenqing c) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into chuchaishenqing values(null,?,?,?,?,?,?)";
		qr.update(sql,c.getChuchaishijian(),c.getChuchaitianshu(),c.getTongxingrenyuan(),c.getMudidi(),c.getChuxingfangshi(),c.getShiyou());	
	}

	public void update(Chuchaishenqing c) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update chuchaishenqing set chuchaishijian=?,chuchaitianshu=?,tongxingrenyuan=?,mudidi=?,chuxingfangshi=?,shiyou=? where id=?";
		qr.update(sql,c.getChuchaishijian(),c.getChuchaitianshu(),c.getTongxingrenyuan(),c.getMudidi(),c.getChuxingfangshi(),c.getShiyou(),c.getId());
	}

}
