package ge.HRGeo.backClasses;

public class activeUser {
	private int activePerson;
	private int activeCompany;
	
	public activeUser(int activePerson,int activeCompany){
		this.activePerson=activePerson;
		this.activeCompany=activeCompany;
	}
	
	public int getActivePerson(){
		return activePerson;
		
	}
	public int getActiveCompany(){
		return activeCompany;
	}
	
	public void setActivePerson(int activePerson){
		this.activePerson=activePerson;
	}
	public void setActiveCompany(int activeCompany){
		this.activeCompany=activeCompany;
	}

}
