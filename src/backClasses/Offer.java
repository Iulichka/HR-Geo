package backClasses;


import java.util.Date;
import java.util.GregorianCalendar;

public class Offer {
	private int offerID;
	private String offerName, text;
	private Date endDate, startDate;
	private Company comp;
	private String status;
	
	public Offer(String offerName, String text, Date endDate, Date startDate, Company comp,int offerID,String status) {
		this.offerName = offerName;
		this.text = text;
		this.endDate = endDate;
		this.startDate = startDate;
		this.comp = comp;
		this.offerID=offerID;
		this.status=status;
	}
	
	public Offer(Company cmp) {
		comp = cmp;
	}
	public String getStatus(){
		return status;
	}
	public void setSatus(String status){
		this.status=status;
	}
	
	public Company getCompany() {
		return comp;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public String getName() {
		return offerName;
	}
	public int getOfferID() {
		return offerID;
	}
	
	public String getText() {
		return text;
	}
	
	public long getRemainingHours() {
		Date now = new Date();
		long milis = endDate.getTime()-now.getTime();
		long hours = milis/(1000*60*60);
		int res = (int) hours;
		return res;
	}
	
	public void setSubject(String sbj) {
		offerName = sbj;
	}
	public void setOfferID(int offerID) {
		this.offerID = offerID;
	}
	
	public void setText(String tx) {
		text = tx;
	}
	
	public void setStartDate(int year, int month, int day) {
		startDate = new GregorianCalendar(year, month, day).getTime();
	}
	
	public void setEndDate(int year, int month, int day) {
		endDate = new GregorianCalendar(year, month, day).getTime();
	}
	
}
