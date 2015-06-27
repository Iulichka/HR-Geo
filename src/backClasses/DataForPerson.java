package backClasses;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DataForPerson {
 Connection con=null;
 public DataForPerson(){
	 con=DataBaseInfo.getConnection();
 }
 public AllOffersForPerson getOffers(int id){
	 AllOffersForPerson offers=new AllOffersForPerson();
	 Statement stm;
	 try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet rSet= stm.executeQuery("select po.offer_id,o.offer_name,o.offer_info, "+
					"o.offer_end_date,o.offer_start_date,c.company_name,po.offer_state "+
					"from  persons_offer po,offer o,company_info c "+
					"where po.offer_id=o.offer_id and po.persons_id="+id+" and o.company_id=c.company_id;");
			while(rSet.next()){
				Offer cur=new Offer(rSet.getString(2),rSet.getString(3),rSet.getDate(4),rSet.getDate(5),
						new Company(rSet.getString(6),null,null,0,null,1,null,null),rSet.getInt(1),rSet.getString(7));
				offers.addOffer(cur);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}		
	 return offers;
 }
 
 public int getPersonId(String email){
	 Statement stm;
	 int res=-1;
	 
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery(
				"select * from persons where person_email='"+email+"';");
		if(rSet.next()){
			res=rSet.getInt(1);
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}		
	 
	 return res;
 }
 public PersonEducation getPersonEducation(int idNum){
	 PersonEducation result=new PersonEducation();
	 Statement stm;
	 try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery(
				"select u.university_name,pu.graduation_type,pu.graduation_year,f.faculty_name "+
				"from person_university pu,university u,faculty f "+
				"where persons_id="+idNum+" and pu.faculty_id=f.faculty_id and pu.university_id=u.university_id;");
		while(rSet.next()){
			Education edu=new Education(rSet.getString(1),rSet.getString(2),rSet.getInt(3),rSet.getString(4));
			result.add(edu);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	 
	 return result;
 }
 public OverallExperience getPersonExperience(int idNum){
	 OverallExperience res=new OverallExperience();
	 Statement stm;
	 try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery(
				"select working_experience_id,position, "+
				" company_name,job_start_date,job_end_date "+
				"from working_experience "+
				"where persons_id="+idNum+";");
		while(rSet.next()){
			Experience exp=new Experience(rSet.getString(2),rSet.getString(3),rSet.getDate(4),
					rSet.getDate(5),rSet.getInt(1));
			res.addExperience(exp);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return res;
 }
 
 public PersonSkills getPersonSkills(int idNum){
	 PersonSkills result=new PersonSkills();
	 Statement stm;
	 try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery(
				"select ps.skills_id,s.skill_name,sc.category_name,sl.skill_level_name "+
				"from person_skills ps,skills s,skill_category sc,skill_level sl "+
				"where ps.persons_id="+idNum+ " and s.category_id=sc.category_id and "+
				"ps.skill_level_id=sl.skill_level_id  and ps.skills_id=s.skills_id order by sc.category_name;");
		while(rSet.next()){
			Skill cur=new Skill(rSet.getString(2),rSet.getString(4),rSet.getInt(1),rSet.getString(3));
			result.addSkill(cur);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return result;
 }
 public Person getPerson(int idNum){
	 Statement stm;
	 Person pers=null;
	 try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select persons_id,person_name,"
				+ "person_surname,person_birth_date,"
				+ "person_sex,person_email,person_info "
				+ "from persons  where persons_id="+idNum+";");
		Date date=null;
		String sex=null;
		String name=null;
		String mail=null;
		String surname=null;
		String id=null;
		String about=null;
		if(rSet.next()){
			  date=rSet.getDate(4);
			  sex=rSet.getString(5);
			  name=rSet.getString(2);
			  mail=rSet.getString(6);
			  surname=rSet.getString(3);
			  id=rSet.getString(1);
			  about=rSet.getString(7);
			 
		}
		//ResultSet rSet2=stm.executeQuery("select person_photo from person_photoes where persons_id="+idNum+";");
		byte[] photo=getPhoto(idNum);
		pers=new Person(name, mail, surname, id, sex, date,photo,about);

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e.getMessage());
	}
	 return pers;
 }
 
 
private byte[] getPhoto(int idNum) {
	 Statement stm;
	 byte[] photo=null;
	 try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		
			ResultSet rSet=stm.executeQuery("select person_photo from person_photoes where persons_id="+idNum+";");
			if(rSet.next()){
				Blob blob = rSet.getBlob(1);
			    photo =  blob.getBytes(1, (int) blob.length());
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	return photo;
}
/**
 * adding pictere causes removing old picture
 * @param idST id
 * @param in file as inputStream
 */
public void addPicture(String idST, InputStream in) {
	int id=0;
	 Statement stm;
	try {
		id = Integer.parseInt(idST);
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		stm.executeUpdate("delete from person_photoes where persons_id = "+id+";");
		java.sql.PreparedStatement prs = con.prepareStatement("insert into person_photoes (person_photo, persons_id) values(?,?)");
		prs.setInt(2, id);
		prs.setBlob(1, in);
		prs.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

	public void updatePerson(Person p,String password,Boolean changePassword,String email){
	Statement stm;
		try {
			stm=con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			if(changePassword){
				stm.executeUpdate("update persons "
						+ "set person_name='"+p.getName()+"', person_surname='"+p.getSurname()+"', "
								+ "person_password='"+password+"', person_birth_date='"+p.getDate()+"', "
										+ "person_email='"+p.getMail()+"', person_sex='"+p.getSex()+"', "
												+ "person_info='"+p.getAbout()+"' "
														+ "where person_email='"+email+"';");
			}else{
				stm.executeUpdate("update persons "
						+ "set person_name='"+p.getName()+"', person_surname='"+p.getSurname()+"', "
								+"person_birth_date='"+p.getDate()+"', "
										+ "person_email='"+p.getMail()+"', person_sex='"+p.getSex()+"', "
												+ "person_info='"+p.getAbout()+"' "
														+ "where person_email='"+email+"';");

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


public void addDocument(String idST, String description, FileInputStream in) {
	int id=0;
	Statement stm;
	try {
		id = Integer.parseInt(idST);
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prs = con.prepareStatement("insert into documents (document_name, document_file, persons_id) values(?,?,?)");
		prs.setInt(3, id);
		prs.setBlob(2, in);
		prs.setString(1, description);
		prs.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
public ArrayList<String> getDocs(String id) {
	ArrayList<String> result = new ArrayList<String>();
	Statement stm;
	try {
		//id = Integer.parseInt(idST);
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet = stm.executeQuery("select document_name from documents  where persons_id = "+id);
		while(rSet.next()) {
			result.add(rSet.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return result;
}
public byte[] getDocument(String id, String name) {
	byte[] result = null;
	Statement stm;
	try {
		//id = Integer.parseInt(idST);
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet = stm.executeQuery("select document_file from documents  where persons_id = "+id+" and document_name = "+"'"+name+"'");
		rSet.next();
		Blob blob = rSet.getBlob(1);
		result =  blob.getBytes(1, (int) blob.length());
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return result;
}

public void changeSkill(int id){
	Statement stm;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prs=con.prepareStatement("update");
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
			
}

}
