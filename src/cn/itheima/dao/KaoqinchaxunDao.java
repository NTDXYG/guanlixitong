package cn.itheima.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import cn.itheima.domain.Shujuzidian;
import cn.itheima.utils.C3P0Utils;
import cn.itheima.web.Kaoqinchaxun;

public class KaoqinchaxunDao {

	@Test
	public void Count() throws SQLException {
		QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "SELECT SUM(shichang) FROM jiaqishenqing WHERE staff_name='ั๎นโ'";
		System.out.println((Double) qr.query(sql, new ScalarHandler()));
	}

}
