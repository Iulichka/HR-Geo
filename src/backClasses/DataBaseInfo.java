package backClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseInfo {
	public static final String MYSQL_USERNAME = "root";
<<<<<<< HEAD
	public static final String MYSQL_PASSWORD = "14159265";
=======
	public static final String MYSQL_PASSWORD = "vayne";
>>>>>>> 82f224425315000ccc3a937c0ce67c3ba2ffe8ae
	public static final String MYSQL_DATABASE_SERVER = "localhost";
	public static final String MYSQL_DATABASE_NAME = "webproject";
	
	private static Connection con;
		static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + MYSQL_DATABASE_SERVER + "/" + MYSQL_DATABASE_NAME;
			con = DriverManager.getConnection(url, MYSQL_USERNAME, MYSQL_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		return con;
	}
	
	public static void close() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
