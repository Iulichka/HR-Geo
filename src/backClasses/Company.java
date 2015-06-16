package backClasses;

import java.util.ArrayList;

public class Company {
	private String name, site, tel, mail, orgForm;
	private double rating;
	private String info;
	private ArrayList<byte []> images;
	@SuppressWarnings("unused")
	private int votersNum;
	
	public Company(String name, String site, String tel, String mail, String orgForm, String info, double rating) {
		this.name = name;
		this.site = site;
		this.tel = tel;
		this.mail = mail;
		this.orgForm = orgForm;
		this.rating = rating;
		this.info = info;
	}
	
	public Company(String name) {
		this.name = name;
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
		return images.size();
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
	
	public void setName(String n) {
		name = n;
	}
	
	public void setSite(String st) {
		site = st;
	}
	
	public void setMail(String m) {
		mail = m;
	}
	
	public void setTel(String t) {
		tel = t;
	}
	
	public void setOrgForm(String f) {
		orgForm = f;
	}
	
	public void setRating(double r) {
		rating = r;
	}
	
	public void setInfo(String inf) {
		info = inf;
	}
	
 }
