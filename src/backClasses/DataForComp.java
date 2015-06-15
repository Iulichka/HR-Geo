package backClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;



// root password 12345678
public class DataForComp {
	
	
	public ArrayList<Company> getCompList() {
		Connection con=DataBaseInfo.getConnection();
		ArrayList<Company> res = new ArrayList<Company>();
		java.sql.Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info");
			while (resSet.next()) {
				Company com = new Company(resSet.getString(2), null, null, resSet.getString(3), null, resSet.getString(4), resSet.getDouble(6),resSet.getString(7));
				res.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return res;
	}
}
