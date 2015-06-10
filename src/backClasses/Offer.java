package backClasses;


import java.util.Date;

public class Offer {
	private String subject, text;
	private Date endDate, startDate;
	private Company comp;
	
	public Offer(String subject, String text, Date endDate, Date startDate, Company comp) {
		this.subject = subject;
		this.text = text;
		this.endDate = endDate;
		this.startDate = startDate;
		this.comp = comp;
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
	
	public String getSubject() {
		return subject;
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
	
}
