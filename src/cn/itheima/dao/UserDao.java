package cn.itheima.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itheima.domain.User;
import cn.itheima.utils.C3P0Utils;

public class UserDao {

	public User login(String name,String password) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where name=? and password=?";
		User user = runner.query(sql, new BeanHandler<User>(User.class), name, password);
		return user;
	}

}
