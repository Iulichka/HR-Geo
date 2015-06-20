package backClasses;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
public class DBSelect {
	private Map<Integer,String> map;
	public boolean searchPerson(String email,String password) throws SQLException{
		Connection con =null;
		con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM persons "
				+ "WHERE " + "person_email = '" + email + "' AND person_password = '"+password
				+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return false;
		}
		return true;
			
	}
	public boolean searchCompany(String email,String password) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt =con.createStatement();
		String query = "SELECT * FROM company_info "
				+ "WHERE " + "company_email = '" + email + "' AND company_password = '"+password
				+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return false;
		}
		return true;
	}
	
	public void addPerson(String name,String surname,String password,String id,Date date,String email,String sex) throws SQLException {
		Connection con=DataBaseInfo.getConnection();

		PreparedStatement stmt = con.prepareStatement("INSERT INTO persons (person_name,person_surname,person_password,person_id_number,person_birth_date,person_email,person_sex,person_education,person_info) "
				+ "values (?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, surname);
		stmt.setString(3, password);
		stmt.setString(4, id);
		stmt.setDate(5, date);
		stmt.setString(6, email);
		stmt.setString(7,sex);
		stmt.setString(8, "არავითარი");
		stmt.setString(9,"info");
		stmt.executeUpdate();
	}
	
	public void addCompany(String name,String email,String password,String tel,String site) throws SQLException {
		Connection con=DataBaseInfo.getConnection();
		PreparedStatement stmt = con.prepareStatement("INSERT INTO company_info (company_name,company_email,company_info,company_password,company_rating,voters_number,company_telephone,company_site) "
				+ "values (?,?,?,?,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, email);
		stmt.setString(3, " ");
		stmt.setString(4, password);
		stmt.setDouble(5, 0);
		stmt.setInt(6, 0);
		stmt.setString(7, tel);
		stmt.setString(8, site);
		stmt.executeUpdate();
	}
	public void addSkill(String name) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		PreparedStatement stmt = con.prepareStatement("INSERT INTO skills (skill_name,searched_number,category_id)"
				+ "values (?,?,?)");
		
		
		
		
	}
	
}
