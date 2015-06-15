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
	private String password;
	public static final String ATTRIBUTE_NAME = "Person";
	public Person(String name,String mail,String surname,int id,byte[] photo,String password){
		this.mail=mail;
		this.name=name;
		this.surname=surname;
		this.id=id;
		this.photo=photo;
		this.password=password;
	}
	
	public Person(String mail,String password){
		this.mail=mail;
		this.password=password;
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
	public String getPassword(){
		return password;
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
	public void setPassword(String password){
		this.password=password;
	}
	
}
