package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

// 그냥 넘겨 준 것을 사용하겠다.. ConnectionFactory로 받아오지만, 오라클인지, mySql인지 알지 않아도 된다! 
public class ConnectionFactory {

	public Connection getConnection() { // try안쓰고 throw로 넘겨도 된다.

		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@192.168.119.119:1521:dink";
			String user = "scott";
			String password = "tiger";
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;

	}
}
