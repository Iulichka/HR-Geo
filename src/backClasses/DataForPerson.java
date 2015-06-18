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
		ResultSet rSet=stm.executeQuery("select p.persons_id,p.person_name,"
				+ "p.person_surname,p.person_birth_date,"
				+ "p.person_sex,p.person_email,ph.person_photo from persons p,person_photoes ph where p.persons_id="+idNum+" and "
						+ "p.persons_id=ph.persons_id ;");
		if(rSet.next()){
			 Date date=rSet.getDate(4);
			 String sex=rSet.getString(5);
			 String name=rSet.getString(2);
			 String mail=rSet.getString(6);
			 String surname=rSet.getString(3);
			 String id=rSet.getString(1);
			 byte[] photo=rSet.getBytes(7);
			 pers=new Person(name, mail, surname, id, sex, date,photo);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return pers;
 }
 
}
