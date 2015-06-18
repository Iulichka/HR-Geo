package backClasses;
/**
 * 
 * @author root
 *
 *this class contains information about one specific skill
 */
public class Skill {
		private String name;
		/** skill level is id of skill in database skill table
		 * 
		 */
		private int level;
		private String skillCategory;
		private int skillId;
		public Skill(String name,int level,int id,String skillCategory){
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
		
		public int getLevel(){
			return level;
		}
		
		public void setLevel(int level){
			this.level=level;
		}
		
		public String getName(){
			return this.name;
		}
		public int getId(){
			return this.skillId;
		}
}
