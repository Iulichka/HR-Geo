package backClasses;

import java.util.ArrayList;
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
}
