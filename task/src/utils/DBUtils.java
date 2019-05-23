
package utils;

import java.sql.*;

public class DBUtils {

	public DBUtils() {
	}

	public static Connection getConnection() throws Exception {
		Class.forName(driver);
		return DriverManager.getConnection(url, user, pwd);
	}

	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if (rs != null)
			try {
				rs.close();
			} catch (Exception exception) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (Exception exception1) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception exception2) {
			}
	}

	/*private static String driver = "oracle.jdbc.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private static String user = "liran";
	private static String pwd = "li123";*/
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost/task?useUnicode=true&characterEncoding=UTF-8&useSSL=true";
	private static String user = "root";
	private static String pwd = "123456";
}