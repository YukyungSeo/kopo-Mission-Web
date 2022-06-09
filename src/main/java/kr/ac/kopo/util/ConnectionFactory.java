package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

import kr.ac.kopo.secure.JDBCSecure;

// 그냥 넘겨 준 것을 사용하겠다.. ConnectionFactory로 받아오지만, 오라클인지, mySql인지 알지 않아도 된다! 
public class ConnectionFactory {

	public Connection getConnection() { // try안쓰고 throw로 넘겨도 된다.

		Connection conn = null;
		try {
			Class.forName(JDBCSecure.CONNECTION_NAME);

			conn = DriverManager.getConnection(JDBCSecure.URL, JDBCSecure.USER, JDBCSecure.PASSWORD);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;

	}
}
