package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import cn.itheima.domain.Shujuzidian;
import cn.itheima.utils.C3P0Utils;

public class ShujuzidianDao {

	public Long Count() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from basic";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
	}

	public List<Shujuzidian> findShujuzidianListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from basic  ORDER BY NAME limit ?,?";
		return qr.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class), index,currentCount);
	}

	public List<Shujuzidian> findAllShujuzidian() throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from basic ORDER BY NAME";
		List<Shujuzidian> shujuzidianList = runner.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class));
		return shujuzidianList;
	}

	public List<Shujuzidian> findShujuzidianByName(String name) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from basic where name = ?";
		List<Shujuzidian> shujuzidianList = runner.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class),name);
		return shujuzidianList;
	}

	public Long CountByName(String name) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from basic where name = ?";
		Long count = (Long) qr.query(sql, new ScalarHandler(),name);
		return count;
	}


	public List<Shujuzidian> findShujuzidianListForPageBean(String name, int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from basic where name = ? limit ?,?";
		return qr.query(sql, new BeanListHandler<Shujuzidian>(Shujuzidian.class), name, index,currentCount);
	}

	public void add(String name, String value) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into basic values(?,?)";
		qr.update(sql,name,value);
		
	}

	public void del(String name, String value) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from basic where name=? and value=?";
		qr.update(sql,name,value);
	}

	public void update(String name, String value, String value_back) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from basic where name=? and value=?";	
		qr.update(sql,name,value);
		QueryRunner qr2 = new QueryRunner(C3P0Utils.getDataSource());
		String sql2 = "insert into basic values(?,?)";
		qr2.update(sql2,name,value_back);
	}

}
