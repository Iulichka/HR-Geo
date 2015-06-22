package backClasses;
import java.lang.*;
import java.util.ArrayList;

/** this class manages person's all offers.it works like iterator.user should check if it has next and then should 
 * use getOffer method
 * 
 * @author levan
 *
 */
public class AllOffersForPerson {
	private ArrayList<Offer> offers;
	private int currentOffer;
	public AllOffersForPerson(){
		offers=new ArrayList<Offer>();
		currentOffer=0;
	}
	public void addOffer(Offer offer){
		offers.add(offer);
	} 
	/**
	 * this method returns personoffer object,
	 * should be used after checking has next method or it will return null
	 * @return
	 */
	public Offer getOffer(){
		if(currentOffer<offers.size() ){
			currentOffer++;
			return offers.get(currentOffer-1);
		}
		return null;
	}
	
	public boolean hasNext(){
		return currentOffer<offers.size();
	}
	
}
