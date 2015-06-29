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
	
	public String getSkillsStat() {
		String result = "";
		try {
			Statement st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet r = st.executeQuery("select s.skill_name, sl.skill_level_name, count(1) as num "
					+ "from person_skills ps, skills s, skill_level sl" +
					"where ps.skills_id = s.skills_id and"+
					"ps.skill_level_id = sl.skill_level_id"+
					"group by s.skill_name, sl.skill_level_name"+
					"order by s.skill_name;");
			int n = 0;
			while (r.next()) {
				
				
				if (n==10) break;
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
			return "1 1";
		}
		return result;
	}
}
