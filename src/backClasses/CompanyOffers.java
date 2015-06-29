package backClasses;

public class CompanyOffers {
	private int companyID;
	private int offerID;
	private int personID;
	private String offerState;
	
		public CompanyOffers(int companyID,int offerID,int personID,String offerState){
			this.companyID=companyID;
			this.personID=personID;
			this.offerID=offerID;
			this.offerState=offerState;
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
	
	public int getCompanyID(){
		return companyID;
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
	public void setCompanyID(int companyID){
		this.companyID=companyID;
	}
	

}
