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
					skillName = r.getString(1);
					quantity = r.getInt(3);
				}
				result = result+" "+skillName;
				result = result +" "+ quantity;
				for (int j=0; j<getLevelsNum()-1; j++) {
					if (r.next()) {
						if (skillName.equals(r.getString(1))) {
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
}
