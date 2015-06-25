package backClasses;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
				"ps.skill_level_id=sl.skill_level_id  and ps.skills_id=s.skills_id;");
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
		ResultSet rSet2=stm.executeQuery("select person_photo from person_photoes where persons_id="+idNum+";");
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
				photo=rSet.getBytes(1);
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	return photo;
}
 
}
