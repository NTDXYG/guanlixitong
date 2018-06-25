package cn.itheima.service;


import java.sql.SQLException;

import cn.itheima.dao.UserDao;
import cn.itheima.domain.User;

public class UserService {

	public User login(String name,String password) throws SQLException {
		// TODO Auto-generated method stub
		UserDao dao = new UserDao();
		return dao.login(name, password);
	}

}
