package backClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBConnectionPull {
	private Connection currentCon;
	private ArrayList<Connection> cons;
	
	public DBConnectionPull() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + DataBaseInfo.MYSQL_DATABASE_SERVER + "/" + DataBaseInfo.MYSQL_DATABASE_NAME;
			currentCon = DriverManager.getConnection(url, DataBaseInfo.MYSQL_USERNAME, DataBaseInfo.MYSQL_PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
