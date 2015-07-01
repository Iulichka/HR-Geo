package backClasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataForStat {
	private Connection con;
	public static final int MALE = 0;
	public static final int FEMALE = 1;
	
	public DataForStat() {
		con=DataBaseInfo.getConnection();
	}
	
	/**
	 * 
	 * @return string "maleN femaleN"
	 */
	public String getGenderNums() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select count(1) from persons group by person_sex order by person_sex desc;");
			r.next();
			int female = r.getInt(1);
			r.next();
			int male  = r.getInt(1);
			result = male +" "+female;
		} catch (SQLException e) {
			e.printStackTrace();
			return "1 1";
		}
		return result;
	}
	/**
	 * it does not works correctly until base not filled with at least 10 most popular skills
	 * @return string to make array in javascript
	 */
	public String getSkillsStat() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select s.skill_name, sl.skill_level_name, count(1) as num "+
					"from person_skills ps, skills s, skill_level sl "+
					"where ps.skills_id = s.skills_id and "+
					"ps.skill_level_id = sl.skill_level_id and"+
                   " s.skills_id  in ("+
						"select  temp.sk_id from "+
							"(select psk.skills_id as sk_id, count(1) from person_skills psk "+
							"group by psk.skills_id "+
							"order by count(1) desc "+
							"limit 10) as temp "+
					")"+
					"group by s.skill_name, sl.skill_level_name "+
					"order by s.skill_name, sl.skill_level_name;");
			for(int i=0; i<10; i++) {
				String skillName = "empty";
				int quantity = 0;
				if(r.next()) {
					skillName = trim(r.getString(1));
					quantity = r.getInt(3);
				}
				result = result+" "+skillName;
				result = result +" "+ quantity;
				for (int j=0; j<getLevelsNum()-1; j++) {
					if (r.next()) {
						if (skillName.equals(trim(r.getString(1)))) {
						result = result + " "+r.getInt(3);
						} else {
							result = result +" 0";
							r.previous();
						}
					} else {
						result = result + " 0";
					}
				}
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			return "1 1";
		}
		return result;
	}

	private String trim(String string) {
		return string.replace(' ', '_');
	}

	private int getLevelsNum() {
		int result = 0;
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select count(1) from skill_level;");
			r.next();
			result = r.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}

	public String getSkillsDemand() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select s.skill_name, s.searched_number from skills s order by s.searched_number desc limit 12;");
			while(r.next()) {
				int n = r.getInt(2);
				String name = trim(r.getString(1));
				if(result.length()==0) {
					result = result+name+" "+n;
				} else {
					result = result +" "+name+" "+n;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "java 0";
		}
		return result;
	}
	
	public String getUniStat() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select s.university_name, ps.graduation_type, count(1) as num "+
					"from person_university ps, university s "+
					"where ps.university_id = s.university_id and "+
				    "s.university_id  in ( "+
						"select  temp.sk_id from "+
							"(select psk.university_id as sk_id, count(1) from person_university psk "+
							"group by psk.university_id "+
							"order by count(1) desc "+
							"limit 10) as temp "+
					") "+
					"group by s.university_name, ps.graduation_type "+
					"order by s.university_name, ps.graduation_type;");
			for(int i=0; i<10; i++) {
				String skillName = "empty";
				int quantity = 0;
				if(r.next()) {
					skillName = trim(r.getString(1));
					quantity = r.getInt(3);
				}
				result = result+" "+skillName;
				result = result +" "+ quantity;
				for (int j=0; j<getLevelsNum()-1; j++) {
					if (r.next()) {
						if (skillName.equals(trim(r.getString(1)))) {
						result = result + " "+r.getInt(3);
						} else {
							result = result +" 0";
							r.previous();
						}
					} else {
						result = result + " 0";
					}
				}
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			return "1 1";
		}
		return result;
	}
	

	public String getFacultyStat() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select f.faculty_name, count(1) from person_university pu, faculty f "+
					"where pu.faculty_id = f.faculty_id "+
					"group by f.faculty_name order by count(1) desc limit 20;");
			while(r.next()) {
				if(result.length()==0) {
					result = result+trim(r.getString(1)) +" "+r.getInt(2);
				} else {
					result = result +" "+trim(r.getString(1)) +" "+r.getInt(2);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "non 1";
		}
		return result;
	}

}
