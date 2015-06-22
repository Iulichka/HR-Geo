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
		return trim(name);
	}
	
	public String getSite() {
		return trim(site);
	}
	
	public String getTel() {
		return trim(tel);
	}
	
	public String getMail() {
		return trim(mail);
	}
	
	public String getOrgForm() {
		return trim(orgForm);
	}
	
	public String getInfo() {
		return trim(info);
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
	
	private String trim(String st) {
		if (st == null) return "";
		return st;
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
