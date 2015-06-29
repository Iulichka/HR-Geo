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

public void addCV(String idST, FileInputStream in) {
	int id=0;
	Statement stm;
	try {
		id = Integer.parseInt(idST);
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prs = con.prepareStatement("insert into person_cv (person_CV, persons_id) values(?,?)");
		prs.setBlob(1, in);
		prs.setInt(2, id);
		prs.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}

public ArrayList<String> getSkillNames(){
	Statement stm;
	ArrayList<String> skills=new ArrayList<String>();

	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select skill_name from skills");
		while(rSet.next()){
			skills.add(rSet.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
	return skills;
	
}
public ArrayList<String> getUniversityNames(){
	Statement stm;
	ArrayList<String> universities=new ArrayList<String>();

	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select university_name from university");
		while(rSet.next()){
			universities.add(rSet.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
	return universities;
	
}
public ArrayList<String> getFacultyNames(){
	Statement stm;
	ArrayList<String> faculties=new ArrayList<String>();

	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select faculty_name from faculty");
		while(rSet.next()){
			faculties.add(rSet.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}		
	return faculties;
	
}
public ArrayList<String> getSkillLevels(){
	Statement stm;
	ArrayList<String> skills=new ArrayList<String>();
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet= stm.executeQuery("select skill_level_name from skill_level ;");	
		while(rSet.next()){
		skills.add(rSet.getString(1));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return skills;
}
public void updateSkill(int id,String Level, int persId) {
	Statement stm;
	int skill_id=getSkillLevelId(Level);
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("update person_skills "
				+ "set skill_level_id= ? "
						+ "where skills_id= ? and persons_id="+persId+";");
		prst.setInt(1, skill_id);
		prst.setInt(2, id);
		prst.executeUpdate();
		
	} catch (SQLException e) {
			e.printStackTrace();
	}
	
	
}
public int getSkillLevelId(String level) {
	Statement stm;
	int id=0;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select skill_level_id from skill_level"
				+ " where skill_level_name='"+level+"';");
		
		if(rSet.next()){
			id=rSet.getInt(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return id;
}
public int getSkillId(String skill){
	Statement stm;
	int id=0;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		ResultSet rSet=stm.executeQuery("select skills_id from skills"
				+ " where skill_name='"+skill+"';");
		
		if(rSet.next()){
			id=rSet.getInt(1);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return id;
	
}

public void deleteSkill(int skill_id, int persId) {
	Statement stm;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("delete from person_skills "
				+ "where skills_id= ? and persons_id="+persId+" ;");
		prst.setInt(1, skill_id);
		prst.executeUpdate();	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
public void addSkill(int skillId, int skillLevelId, int persId) {
	Statement stm;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("insert into person_skills "
				+ "(skills_id, persons_id, skill_level_id) values(?,?,?)");
		prst.setInt(1, skillId);
		prst.setInt(2, persId);
		prst.setInt(3, skillLevelId);
		prst.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
public void changeEducation(int persId, String universityName,
		String facultyName, int gradYear, String gradType) {
	Statement stm;
	int uniId=getUniversityID(universityName);
	int facultyID=getFacultyId(facultyName);
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("update person_university"
				+ " set graduation_year = ? , graduation_type = ? "
				+ "where persons_id = ? and university_id = ? and faculty_id = ?");
		prst.setInt(1, gradYear);
		prst.setString(2, gradType);
		prst.setInt(3, persId);
		prst.setInt(4, uniId);
		prst.setInt(5, facultyID);
		prst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}
private int getFacultyId(String facultyName) {
	int id=0;
	Statement stm;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("select faculty_id from faculty "
				+ "where faculty_name = ? ;");
				prst.setString(1, facultyName);
				ResultSet rst= prst.executeQuery();
				if(rst.next()){
					id=rst.getInt(1);
				}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return id;
}
private int getUniversityID(String universityName) {
	int id=0;
	Statement stm;
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("select university_id from university where"
				+ " university_name = ? ;");
				prst.setString(1, universityName);
				
				ResultSet rst= prst.executeQuery();
				if(rst.next()){
					id=rst.getInt(1);
				}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return id;
}
public void deleteEducation(int persId, String universityName,
		String facultyName) {
	Statement stm;
	int uniId=getUniversityID(universityName);
	int facultyID=getFacultyId(facultyName);
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("delete from person_university where "
				+ " persons_id="+persId+" and university_id = ? and faculty_id = ? ;");
		prst.setInt(1, uniId);
		prst.setInt(2,facultyID);
		prst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
public void addEducation(int persId, String uni, String faculty, int year,
		String gradType) {
	Statement stm;
	int uniID=getUniversityID(uni);
	int facultyId=getFacultyId(faculty);
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("insert into person_university (persons_id"
				+ ",university_id,faculty_id,graduation_year,graduation_type )"
				+ " values(?,?,?,?,?)");
		prst.setInt(1, persId);
		prst.setInt(2, uniID);
		prst.setInt(3, facultyId);
		prst.setInt(4,year);
		prst.setString(5, gradType);
		prst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
public void changeExperience(int expId,java.util.Date dStart, java.util.Date dEnd) {
	Statement stm;
	Date sDate=new Date(dStart.getYear(), dStart.getMonth(), dStart.getDate());
	Date eDate=null;
	if(dEnd!=null){
	 eDate=new Date(dEnd.getYear(),dEnd.getMonth(),dEnd.getDate());
	}
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("update working_experience set job_start_date= ? ,"
				+ " job_end_date= ? where working_experience_id = ? ;");
		prst.setDate(1, sDate);
		prst.setDate(2, eDate);
		prst.setInt(3, expId);
		prst.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public void deleteExp(int expId) {
	Statement stm;

	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("delete from working_experience "
				+ "where working_experience_id = ? ;");
		prst.setInt(1, expId);
		prst.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
public void addExperience(int persId, String comName, String posName,
		java.util.Date dStart, java.util.Date dEnd) {
	Statement stm;
	Date sDate=new Date(dStart.getYear(), dStart.getMonth(), dStart.getDate());
	Date eDate=null;
	if(dEnd!=null){
	 eDate=new Date(dEnd.getYear(),dEnd.getMonth(),dEnd.getDate());
	}
	try {
		stm=con.createStatement();
		stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
		java.sql.PreparedStatement prst=con.prepareStatement("insert into working_experience "
				+ "(persons_id,company_name,position,job_start_date,job_end_date)"
				+ " values"
				+ "(?,?,?,?,?) ;");
		prst.setInt(1, persId);
		prst.setString(2, comName);
		prst.setString(3, posName);
		prst.setDate(4, sDate);
		prst.setDate(5, eDate);
		prst.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
}



}
