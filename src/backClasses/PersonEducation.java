package backClasses;

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
	
	public void deleteEdu(int id){
		for(int i=0;i<edu.size();i++){
			if(edu.get(i).getId()==id){
				edu.remove(i);
				return;
			}
		}
	}
	
	public ArrayList<Education> getEduList(){
		return edu;
	}

}
