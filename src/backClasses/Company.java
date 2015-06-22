package backClasses;

import java.util.ArrayList;

public class Company {
	private String name, site, tel, mail, orgForm,password;
	private double rating;
	private String info;
	private ArrayList<byte []> images;
	@SuppressWarnings("unused")
	private int votersNum;
	
	public Company(String name,String mail, String info, double rating,String password,int votersNum,String tel,String site) {
		this.name = name;
		this.mail = mail;
		this.rating = rating;
		this.info = info;
		this.votersNum=votersNum;
		this.tel=tel;
		this.site=site;
	}
	
	
	
	public String getName() {
		return name;
	}
	
	public String getSite() {
		return site;
	}
	
	public String getTel() {
		return tel;
	}
	
	public String getMail() {
		return mail;
	}
	
	public String getOrgForm() {
		return orgForm;
	}
	
	public String getInfo() {
		return info;
	}
	
	public int getImagesNum() {
		DataForComp c = new DataForComp();
		return c.getPicNum(mail);
	}
	public String getPassword(){
		return password;
	}
	
	public void addImage(byte [] im) {
		images.add(im);
	}
	
	public ArrayList<byte []> getImages() {
		return images;
	}
	

	
	public double getRating() {
		return rating;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setSite(String site) {
		this.site = site;
	}
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public void setOrgForm(String orgForm) {
		this.orgForm = orgForm;
	}
	
	public void setRating(double rating) {
		this.rating = rating;
	}
	
	public void setInfo(String info) {
		this.info = info;
	}
	public void setPassword(String password){
		this.password=password;
	}
	
 }
