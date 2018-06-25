package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itheima.domain.Shujuzidian;
import cn.itheima.domain.Staff;
import cn.itheima.utils.C3P0Utils;

public class StaffDao {

	public Long Count() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from staff";
		Long count = (Long) qr.query(sql, new ScalarHandler());
		return count;
	}

	public List<Staff> findAllStaffListForPageBean(int index, int currentCount) throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from staff limit ?,?";
		return qr.query(sql, new BeanListHandler<Staff>(Staff.class), index, currentCount);
	}

	public List<Staff> findAllStaff() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from staff";
		return qr.query(sql, new BeanListHandler<Staff>(Staff.class));
	}

	public void add(String name) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into staff values(null,?)";
		qr.update(sql, name);
	}

	public void delete(String id) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from staff where id=?";
		qr.update(sql, id);
	}

	public void update(String id, String name) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update staff set name = ? where id=?";
		qr.update(sql, name, id);
	}

}
