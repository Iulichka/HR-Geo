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
		ps.getPersons(fac, fac, fac, 0, 3);
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
		String selectWithExperience="";
		if(workingExperience!=0){
			selectWithExperience=getExpSelectString(workingExperience);
		}else{
			selectWithExperience=getAllIdsString("pi5", "we");
		}
		try {
			stm = con.createStatement();
			stm.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			PreparedStatement prst=con.prepareStatement(
					"select * "
					+ "from ("+selectWithUni+") as fromUni, "
							+ " ("+selectWithFaculty+") as fromFaculty, "
									+ "("+selectWithSkills+") as fromSkill, "
											+ "("+selectWithAge+") as fromAge, "
													+ "("+selectWithExperience+") as fromExp "
					+ "where fromUni.pi1=fromFaculty.pi2 and fromFaculty.pi2=fromSkill.pi3 "
					+ "and fromSkill.pi3=fromAge.pi4 and fromAge.pi4=fromExp.pi5;"
					);
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
	
	private String getExpSelectString(int workingExperience) {
		String mins=
	"select startings.pi6 as pi5 "+
	"from "+
	"(select we1.persons_id pi6, min(we1.job_start_date) startDate " +
	"from working_experience we1 "+
	"group by pi6) startings, "+
	"(select maxis.pi8 pi7,max(maxis.endDate) endFinal "+
	"from (select we3.persons_id pi8,if(we3.job_end_date is null,curdate(),we3.job_end_date) endDate "+
	"from working_experience we3) as maxis "+
	"group by pi7) endings "+
    "where startings.pi6=endings.pi7 and TIMESTAMPDIFF(YEAR,startings.startDate,endings.endFinal)>"+workingExperience+" "+
    "group by pi5";
		return mins;
	}
	private String getAgeSelectString(int personAge) {
		return "select  prs.persons_id pi4 from persons prs where TIMESTAMPDIFF(YEAR,prs.person_birth_date,curdate())>"+personAge+"";
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
		String end="group by pi3 having c3 =" + chosenSkillsIds.size() + " ";
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
		String end="group by pi2";
		
		
		return start+middle+end;
	}
	private String getAllIdsString(String string, String string2) {
		String res="select "+string2+"."+"persons_id"+" "+string+" from persons "+string2+""; 
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
		String end="group by pi1";
		
		
		return start+middle+end;
	}
	 
	 
}