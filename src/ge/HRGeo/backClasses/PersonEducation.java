package ge.HRGeo.backClasses;

import java.util.ArrayList;

/**
 * 
 * @author root
 *this class stores information about person's education, university
 */
public class PersonEducation {
	private ArrayList<Education> edu;
	public PersonEducation(){
		edu=new ArrayList<Education>();
		
	}
	public void add(Education e){
		edu.add(e);
	}
	
	public void deleteEdu(String uni,String faculty){
		for(int i=0;i<edu.size();i++){
			if(edu.get(i).getUniversity().equals(uni) && edu.get(i).getFaculty().equals(faculty)){
				edu.remove(i);
				return;
			}
		}
	}
	
	public ArrayList<Education> getEduList(){
		return edu;
	}

}
