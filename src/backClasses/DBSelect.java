package backClasses;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBSelect {
	public boolean searchPerson(Person person) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM persons   "
				+ "WHERE " + "email = " + person.getMail() + " AND password = "+person.getPassword()
				+ " ;";
		ResultSet rs=stmt.executeQuery(query);
		if(rs==null) return false;
		return true;
	}
	public boolean searchCompany(Company company) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM company_info   "
				+ "WHERE " + "email = " + company.getMail() + " AND password = "+company.getPassword()
				+ " ;";
		ResultSet rs=stmt.executeQuery(query);
		if(rs==null) return false;
		return true;
	}
}
