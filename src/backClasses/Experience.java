package backClasses;

import java.util.Date;

/**
 * 
 * @author Nodo
 *
 */
public class Experience {
	private String position, company;
	private Date startDate, endDate;
	private boolean isCurrent;
	
	// if endDate = null considered as current
	public Experience(String pos, String comp, Date st, Date end) {
		position = pos;
		company = comp;
		startDate = st;
		endDate = end;
		isCurrent = (end == null);
	}
	
	public String getCompName() {
		return company;
	}
	
	public String getPosition() {
		return position;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	@SuppressWarnings("deprecation")
	public int getDuration() {
		if (endDate == null) return new Date().getYear()-startDate.getYear();
		return endDate.getYear() - startDate.getYear();
	}
	
	public boolean isCurrent() {
		return isCurrent;
	}
	
	public void setPosition(String pos) {
		position = pos;
	}
	
	public void setCompany(String comp) {
		company = comp;
	}
	
	public void setStartDate(Date d) {
		startDate = d;
	}
	
	public void setEndDate(Date d) {
		endDate = d;
	}
	
	public void setCurrent(boolean cur) {
		isCurrent = cur;
	}
	
	@Override
	public int hashCode() {
		return startDate.hashCode() + company.hashCode()/position.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == this) return true;
		if((obj == null) || (obj.getClass() != this.getClass())) { 
			return false; 
		}
		Experience exp = (Experience) obj;
		if (exp.getCompName().equals(company) && exp.getStartDate().equals(startDate) &&
				exp.getPosition().equals(position)) return true;
		return false;
	}
	
}
