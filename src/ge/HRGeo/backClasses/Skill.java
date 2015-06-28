package ge.HRGeo.backClasses;
/**
 * 
 * @author root
 *
 *this class contains information about one specific skill
 */
public class Skill {
		private String name;
		private String level;
		private String skillCategory;
		private int skillId;
		public Skill(String name,String level,int id,String skillCategory){
			this.name=name;
			this.level=level;
			this.skillId=id;
			this.skillCategory=skillCategory;
		}
		
		public String getCategory(){
			return skillCategory;
		}
		public void setCategoru(String category){
			this.skillCategory=category;
		}
		
		public String getLevel(){
			return level;
		}
		
		public void setLevel(String level){
			this.level=level;
		}
		
		public String getName(){
			return this.name;
		}
		public int getId(){
			return this.skillId;
		}
}
