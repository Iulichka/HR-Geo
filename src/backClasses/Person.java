package backClasses;
/** this project contains info about person
 * 
 * @author root
 *
 */
public class Person {
	private String name;
	private String mail;
	private String surname;
	private int id;
	private byte[] photo;
	
	public Person(String name,String mail,String surname,int id,byte[] photo){
		this.mail=mail;
		this.name=name;
		this.surname=surname;
		this.id=id;
		this.photo=photo;
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
	
	public int getId(){
		return id;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public void setSurname(String surname){
		this.surname=surname;
	}
	public void setMail(String mail){
		this.mail=mail;
	}
	
}
