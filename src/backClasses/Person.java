package backClasses;

import java.sql.Date;

/** this project contains info about person
 * 
 * @author root
 *
 */
public class Person {
	private Date date;
	private String sex;
	private String name;
	private String mail;
	private String surname;
	private String id;
	private byte[] photo;
	private String about="";
	public static final String ATTRIBUTE_NAME = "Person";
	public Person(String name,String mail,String surname,String id,String sex,Date date,byte[] photo,String about){
		this.mail=mail;
		this.name=name;
		this.surname=surname;
		this.id=id;
		this.sex=sex;
		this.date=date;
		this.about=about;
	}
	public void setAbout(String about){
		this.about=about;
	}
	public String getAbout(){
		return about;
	}

	public Date getDate(){
		return date;
	}
	public String getName(){
		return name;		
	}
	
	public String getMail(){
		return mail;
	}
	
	public String getSurname(){
		return surname;
	}
	public byte[] getPhoto(){
		return photo;
	}
	
	public String getId(){
		return id;
	}
	public String getSex(){
		return sex;
	}
	
	public void setName(String name){
		this.name=name;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	
	public void setSurname(String surname){
		this.surname=surname;
	}
	public void setMail(String mail){
		this.mail=mail;
	}
	public void setDate(Date date){
		this.date=date;
	}
	
	public void setPhoto(byte [] phot) {
		photo = phot;
	}
	
}
