package backClasses;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

		PreparedStatement stmt = con.prepareStatement("INSERT INTO persons (person_name,person_surname,person_password,person_id_number,person_birth_date,person_email,person_sex,person_education,person_info) "
				+ "values (?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, person.getName());
		stmt.setString(2, person.getSurname());
		stmt.setString(3, person.getPassword());
		stmt.setString(4, person.getId());
		stmt.setDate(5, person.getDate());
		stmt.setString(6, person.getMail());
		stmt.setString(7,person.getSex());
		stmt.setString(8, "არავითარი");
		stmt.setString(9,"info");
		stmt.executeUpdate();
	}
	
	public void addCompany(Company company) throws SQLException {
		Connection con=DataBaseInfo.getConnection();
		PreparedStatement stmt = con.prepareStatement("INSERT INTO company_info (company_name,company_email,company_info,company_password,company_rating,voters_number) "
				+ "values (?,?,?,?,?,?)");
		stmt.setString(1, company.getName());
		stmt.setString(2, company.getMail());
		stmt.setString(3, " ");
		stmt.setString(4, company.getPassword());
		stmt.setDouble(5, 0);
		stmt.setInt(6, 0);
		stmt.executeUpdate();
	}
}
