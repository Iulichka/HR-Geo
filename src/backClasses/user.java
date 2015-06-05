package backClasses;
/** user is the class which contains information about person
 */
public class user {
	private String name;
	private String mail;
	private String surname;
	private int id;
	private byte[] photo;
	
	public user(String name,String mail,String surname,int id,byte[] photo){
		this.mail=mail;
		this.name=name;
		this.surname=surname;
		this.id=id;
		this.photo=photo;
	}
	
	private String getName(){
		return name;		
	}
	
	private String getMail(){
		return mail;
	}
	
	private String getSurname(){
		return surname;
	}
	private byte[] getPhoto(){
		return photo;
	}
	
	private int getId(){
		return id;
	}
	
	private void setName(String name){
		this.name=name;
	}
	
	private void setSurname(String surname){
		this.surname=surname;
	}
	private void setMail(String mail){
		this.mail=mail;
	}
	
}