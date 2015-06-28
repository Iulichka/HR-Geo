package ge.HRGeo.backClasses;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import com.mysql.jdbc.PreparedStatement;



// root password 12345678
public class DataForComp {
	private Connection con;
	public DataForComp() {
		con = DataBaseInfo.getConnection();
	}
	
	public ArrayList<Company> getCompList() {
		ArrayList<Company> res = new ArrayList<Company>();
		java.sql.Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info order by company_rating desc");
			while (resSet.next()) {
				Company com = new Company(resSet.getString(2), resSet.getString(3), resSet.getString(4), resSet.getDouble(6), null, 0, null, null);
				res.add(com);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return res;
	}
	
	public Company getComp(String mail) {
		java.sql.Statement st;
		Company res = null;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select * from company_info where company_email = '"+mail+"'");
			resSet.next();
			res = new Company(resSet.getString(2), resSet.getString(3), resSet.getString(4), resSet.getDouble(6), null, 
					resSet.getInt(7), resSet.getString(8), resSet.getString(9));
		} catch (Exception e) {
			e.printStackTrace();
			return res;
		}
		return res;
	}
	
	public byte[] getCompPic(String mail, int n) throws IOException {
		/*File fnew=new File("C:/Users/Nodo/Desktop/New folder/pic.jpg");
		BufferedImage originalImage=ImageIO.read(fnew);
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		ImageIO.write(originalImage, "jpg", baos );
		return baos.toByteArray();
		*/
		//return null;
		java.sql.Statement st;
		byte[] res = null;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			java.sql.PreparedStatement preSt = con.prepareStatement("select company_photo from company_photo where company_id = ?");
			preSt.setInt(1, Integer.parseInt(getCompId(mail)));
			ResultSet resSet = preSt.executeQuery();
		for(int i=0; i<n; i++) {
			resSet.next();
		}
			Blob blob = resSet.getBlob("company_photo");
		    res =  blob.getBytes(1, (int) blob.length());

		} catch (Exception e) {
			System.out.println("ex ar varga");
			e.printStackTrace();
			return res;
		}
		return res;
	}
	
	public void addPicture(String mail, InputStream in) {
		int id=0;
		try {
			Statement st;
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			id = Integer.parseInt(getCompId(mail));
			java.sql.PreparedStatement prs = con.prepareStatement("insert into company_photo (company_id, company_photo) values(?,?)");
			prs.setInt(1, id);
			prs.setBlob(2, in);
			prs.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private String getCompId(String mail) {
		String id=null;
		Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select c.company_id from company_info c where c.company_email = '"+mail+"'");
			resSet.next();
			id = resSet.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public int getPicNum(String mail) {
		Statement st;
		int res;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select count(1) from company_photo  where company_id = '"+getCompId(mail)+"'");
			resSet.next();
			res = resSet.getInt(1);
		} catch (SQLException e) {
			res = 0;
			e.printStackTrace();
		}
		return res;
	}

	public double vote(String mail, int score) {
		double result = 0;
		Statement st;
		try {
			st = con.createStatement();
			st.executeQuery("USE " + DataBaseInfo.MYSQL_DATABASE_NAME);
			ResultSet resSet = st.executeQuery("select company_rating, voters_number from company_info where company_email = '"
						+mail+"'");
			resSet.next();
			double curRate = resSet.getDouble(1);
			int votersN = resSet.getInt(2)+1;
			result = (curRate+score)/(votersN);
			st.executeUpdate("update company_info set voters_number = "+votersN+", company_rating = "+result+
					"where company_email = '"+mail+"';");
		} catch (SQLException e) {
			result = 0;
			System.out.println(mail);
			e.printStackTrace();
		}
		return result;
	}
}
