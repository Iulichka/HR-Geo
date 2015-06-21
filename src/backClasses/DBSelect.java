package backClasses;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;

import backClasses.PersonOffer;

public class DBSelect {

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
	
	public int getPersonId(String email) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt=con.createStatement();
		stmt.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		String query = "SELECT * FROM persons "
				+ "WHERE " + "person_email = '" + email + "' ;";
		ResultSet rs=stmt.executeQuery(query);
		int id=rs.getInt(1);		
		return id;
	}
	
	public int getCompanyId(String email)throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt=con.createStatement();
		String query = "SELECT * FROM company_info "
				+ "WHERE " + "company_email = '" + email + "' ;";
		ResultSet rs=stmt.executeQuery(query);
		int id=rs.getInt(1);		
		return id;
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
	
	public void addPersonSkill(String skills,int personID) throws SQLException{	
		Connection con=DataBaseInfo.getConnection();
		StringTokenizer token=new StringTokenizer(skills, ",");
		Statement stmt=con.createStatement();
		while(token.hasMoreTokens()){
			String skill=token.nextToken();
			String querySkillID = "SELECT * FROM skills "
					+ "WHERE " + "skill_name = '" + skill + "' ;";
			ResultSet rs=stmt.executeQuery(querySkillID);
			int skillID=rs.getInt(1);
			String queryPersonSkill = "SELECT * FROM person_skills "
					+ "WHERE " + "skills_id = '" + skillID + "AND persons_id = '" + personID+ "' ;";
			ResultSet rs2=stmt.executeQuery(queryPersonSkill);
			if(!rs2.next()){
				PreparedStatement stm = con.prepareStatement("INSERT INTO person_skills (skills_id,persons_id,skill_level_id) "
						+ "values (?,?,?)");
				stm.setInt(1, skillID);
				stm.setInt(2,personID);
				stm.setInt(3, 1);
				stm.executeUpdate();
			}			
		}			
	}
	public int getNumberOfSkills(int personID) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		int result=0;
		Statement stmt=con.createStatement();
		String query = "SELECT * FROM person_skills "
				+ "WHERE " + "persons_id = '" + personID+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		while(!rs.next()){
			result++;
		}
		return result;
		
	}
	
	public ArrayList<PersonOffer> getPersonOffers(int personID) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt=con.createStatement();
		String query = "SELECT * FROM persons_offer "
				+ "WHERE " + "persons_id = '" + personID+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		ArrayList<PersonOffer> result=new ArrayList<PersonOffer>();		
		while(rs.next()){
			PersonOffer perOff=new PersonOffer(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
			result.add(perOff);
		}
		return result;
	}
	
	public Company getCompany(int companyID) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt=con.createStatement();
		String query = "SELECT * FROM company_info "
				+ "WHERE " + "company_id = '" + companyID+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return null;
		}
		Company company= new Company(rs.getString("company_email"), rs.getString("company_name"), rs.getString("company_info"),rs.getDouble("company_rating"), rs.getString("company_password"),rs.getInt("voters_number"), rs.getString("company_telephone"),rs.getString("company_site"));		
		return company;
	}
	
	public Offer getOffer(int offerID) throws SQLException{
		Connection con=DataBaseInfo.getConnection();
		Statement stmt=con.createStatement();
		String query = "SELECT * FROM offer "
				+ "WHERE " + "offer_id = '" + offerID+ "' ;";
		ResultSet rs=stmt.executeQuery(query);
		if(!rs.next()){
			return null;
		}
		Company company=null;
		company=getCompany(rs.getInt("company_id"));
		Offer offer=new Offer(rs.getString("offer_name"), rs.getString("offer_info"), rs.getDate("offer_end_date"), rs.getDate("offer_start_date"), company);
		return offer;
	}
	
}
