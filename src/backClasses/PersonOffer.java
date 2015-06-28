package backClasses;

public class PersonOffer {
	private int personID;
	private int offerID;
	private String offerState;
	private String emailState;
	
	public PersonOffer(int personID,int offerID,String offerState,String emailState){
		this.personID=personID;
		this.offerID=offerID;
		this.offerState=offerState;
		this.emailState=emailState;
	}
	
	
	public int getPersonID(){
		return personID;
	}
	
	public int getOfferID(){
		return offerID;
	}
	
	public String getOfferState(){
		return offerState;
	}
	
	public String getEmailState(){
		return emailState;
	}
	
	public void setPersonID(int personID){
		this.personID=personID;
	}
	
	public void setOfferID(int offerID){
		this.offerID=offerID;
	}
	public void setOfferState(String offerState){
		this.offerState=offerState;
	}
	
	public void setEmailState(String emailState){
		this.emailState=emailState;
	}
	
	
}
