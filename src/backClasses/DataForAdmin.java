package backClasses;

import java.sql.Connection;

public class DataForAdmin {
	private Connection con;
	public DataForAdmin() {
		con = DataBaseInfo.getConnection();
	}
	
	public void addSkill(int categoryId, String name){
		
	}
}
