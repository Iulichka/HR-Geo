package backClasses;

import java.util.ArrayList;
import java.util.HashMap;
/**
 * this class stores person's skills
 * @author root
 *
 */
public class PersonSkills {
	private ArrayList<Skill> skills;
	public PersonSkills(){
		skills=new ArrayList<Skill>();
	}
	public PersonSkills(ArrayList<Skill> skills){
		this.skills=skills;
	}
	
	public void addSkill(Skill skill){
		skills.add(skill);
	}
	public ArrayList<Skill> getPersonSkills(){
		return this.skills;
	}
	
	/**
	 * 
	 * @return hashMap with category as key and skills inn this category as arrayList
	 */
	public HashMap<String, ArrayList<Skill> > getCategoryMap() {
		HashMap<String, ArrayList<Skill> > res = new HashMap<String, ArrayList<Skill> >();
		for (int i=0; i<skills.size(); i++) {
			Skill curSkill = skills.get(i);
			String curCat = curSkill.getCategory();
			if (res.keySet().contains(curCat)) {
				res.get(curCat).add(curSkill);
			} else {
				ArrayList<Skill> temp = new ArrayList<Skill>();
				temp.add(curSkill);
				res.put(curCat, temp);
			}
		}
		return res;
	}
}
