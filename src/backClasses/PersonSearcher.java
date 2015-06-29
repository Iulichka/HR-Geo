package backClasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class PersonSearcher {
	
	public static void main(String[] args) {
		ArrayList<Integer> fac=new ArrayList<Integer>();
		PersonSearcher ps=new PersonSearcher();
		fac.add(1);
		fac.add(2);
		fac.add(3);
		ps.getPersons(fac, fac, fac, 0, 0);
	}
	
	 Connection con=null;
	 public PersonSearcher(){
		 con=DataBaseInfo.getConnection();
			 
	}
	public  ArrayList<Integer> getPersons(ArrayList<Integer> chosenUnisIds,
			ArrayList<Integer> chosenFacultyIds,
			ArrayList<Integer> chosenSkillsIds, int personAge,
			int workingExperience) {
		Statement stm;
		String selectWithUni="";
		if(chosenUnisIds.size()!=0){
			selectWithUni=getUniSelectString(chosenUnisIds);
		}else{
			selectWithUni=getAllIdsString("pi1","pu");
		}
		String selectWithFaculty="";
		
		if(chosenFacultyIds.size()!=0){
			selectWithFaculty=getFacultySelectString(chosenFacultyIds);
		}else{
			selectWithFaculty=getAllIdsString("pi2", "puf");
		}
		String selectWithSkills="";
		if(chosenSkillsIds.size()!=0){
			selectWithSkills=getSkillSelectString(chosenSkillsIds);
		}else{
			selectWithSkills=getAllIdsString("pi3", "ps");
		}
		String selectWithAge=getAgeSelectString(personAge);
		String selectWithExp=
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			PreparedStatement prst=con.prepareStatement(selectWithSkills);
			ResultSet rset=prst.executeQuery();
			int id=-1;
			while(rset.next()){
				 id=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		
		return null;
	}
	
	private String getAgeSelectString(int personAge) {
		return "select  prs.persons_id pi4 from persons prs where TIMESTAMPDIFF(YEAR,prs.person_birth_date,curdate())>"+personAge+";";
	}
	private String getSkillSelectString(ArrayList<Integer> chosenSkillsIds) {
		String start="select ps.persons_id as pi3,count(*) c3 from person_skills ps where ";
		String middle="";
		for(int i=0;i<chosenSkillsIds.size();i++){
			middle+="ps.skills_id="+chosenSkillsIds.get(i)+" ";
			if(i!=(chosenSkillsIds.size()-1)){
				middle+="or ";
			}
		}
		String end="group by pi3 having c3 =" + chosenSkillsIds.size() + " ;";
		return start+middle+end;
	}
	private String getFacultySelectString(ArrayList<Integer> chosenFacultyIds) {
		String start="select puf.persons_id as pi2 from person_university puf where ";
		String middle="";
		for(int i=0;i<chosenFacultyIds.size();i++){
			middle+="puf.faculty_id="+chosenFacultyIds.get(i)+" ";
			if(i!=(chosenFacultyIds.size()-1)){
				middle+="or ";
			}
		}
		String end="group by pi2;";
		
		
		return start+middle+end;
	}
	private String getAllIdsString(String string, String string2) {
		String res="select "+string2+"."+"persons_id"+" "+string+" from persons "+string2+";"; 
		return res;
	}
	private String getUniSelectString(ArrayList<Integer> chosenUnisIds) {
		String start="select pu.persons_id as pi1 from person_university pu where ";
		String middle="";
		for(int i=0;i<chosenUnisIds.size();i++){
			middle+="pu.university_id="+chosenUnisIds.get(i)+" ";
			if(i!=(chosenUnisIds.size()-1)){
				middle+="or ";
			}
		}
		String end="group by pi1;";
		
		
		return start+middle+end;
	}
	 
	 
}