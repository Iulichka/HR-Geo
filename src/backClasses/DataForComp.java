package backClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;



// root password 12345678
public class DataForComp {
	private Connection con;
	public DataForComp() {
		con = DataBaseInfo.getConnection();
	}
	
	public ArrayList<Company> getCompList() {
		ArrayList<Company> res = new ArrayList<Company>();
		java.sql.Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info order by company_rating desc");
			while (resSet.next()) {
				Company com = new Company(resSet.getString(2), resSet.getString(3), resSet.getString(4), resSet.getDouble(6), null, 0, null, null);
				res.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return res;
	}
	
	public Company getComp(String mail) {
		java.sql.Statement st;
		Company res = null;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info where company_email = '"+mail+"'");
			resSet.next();
			res = new Company(resSet.getString(2), resSet.getString(3), resSet.getString(4), resSet.getDouble(6), null, 
					resSet.getInt(7), resSet.getString(8), resSet.getString(9));
		} catch (Exception e) {
			e.printStackTrace();
			return res;
		}
		return res;
	}
}
