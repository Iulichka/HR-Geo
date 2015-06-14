package backClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.mysql.jdbc.Statement;


// root password 12345678
public class DataForComp {
	private Connection con;
	
	public DataForComp() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://"
					+DataBaseInfo.MYSQL_DATABASE_SERVER, DataBaseInfo.MYSQL_USERNAME, DataBaseInfo.MYSQL_PASSWORD);

			//con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<Company> getCompList() {
		ArrayList<Company> res = new ArrayList<Company>();
		java.sql.Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info");
			while (resSet.next()) {
				Company com = new Company(resSet.getString(2), null, null, resSet.getString(3), null, resSet.getString(4), resSet.getDouble(6));
				res.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return res;
	}
}
