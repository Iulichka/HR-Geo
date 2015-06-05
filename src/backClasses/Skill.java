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
		private int skillId;
		public Skill(String name,int level,int id){
			this.name=name;
			this.level=level;
			this.skillId=id;
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
