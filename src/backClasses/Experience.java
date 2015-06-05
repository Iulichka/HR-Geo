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
	
	
	public Experience(String pos, String comp, Date st, Date end, boolean cur) {
		position = pos;
		company = comp;
		startDate = st;
		endDate = end;
		isCurrent = cur;
	}
	
}
