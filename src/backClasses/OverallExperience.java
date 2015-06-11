package backClasses;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class OverallExperience {
	private Set<Experience> exps;
	
	public OverallExperience() {
		exps = new HashSet<Experience>();
	}
	/**
	 * 
	 * @return sum of all years of experience
	 */
	public int getSumOfFullYears() {
		int res = 0;
		Iterator<Experience> it = exps.iterator();
		while(it.hasNext()) {
			res = res + it.next().getMonthDuration();
		}
		return res/12;
	}
	
	public void addExperience(Experience e) {
		exps.add(e);
	}
	
	public int getQuantity() {
		return exps.size();
	}
	
	public void removeExperience(Experience e) {
		exps.remove(e);
	}
	
	public Iterator<Experience> getIterator() {
		return exps.iterator();
	}
}
