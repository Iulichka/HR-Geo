package backClasses;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class DBSelect {
	public boolean searchPerson(Person person) throws SQLException{
		Connection con =null;
		con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM persons "
				+ "WHERE " + "person_email = '" + person.getMail() + "' AND person_password = '"+person.getPassword()
				+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return false;
		}
		return true;
			
	}
	public boolean searchCompany(Company company) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM company_info "
				+ "WHERE " + "company_email = '" + company.getMail() + "' AND company_password = '"+company.getPassword()
				+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return false;
		}
		return true;
	}
	public void addPerson(Person person) throws SQLException {
		Connection con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query= "INSERT INTO persons VALUES("+person.getName()+ " , "+person.getSurname()+" , "
				+person.getPassword()+" , "+person.getId()+" , "+person.getDate()+" , "+person.getMail()+" , "+person.getSex()+" არავითარი "+ ");";
		stmt.executeQuery(query);
	}
}
