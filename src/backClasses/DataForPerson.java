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
