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
	private ArrayList<PersonOffer> offers;
	private int currentOffer;
	public AllOffersForPerson(){
		offers=new ArrayList<PersonOffer>();
		currentOffer=0;
	}
	public void addOffer(PersonOffer offer){
		offers.add(offer);
	} 
	/**
	 * this method returns personoffer object,
	 * should be used after checking has next method or it will return null
	 * @return
	 */
	public PersonOffer getOffer(){
		if(currentOffer<offers.size()){
			currentOffer++;
			return offers.get(currentOffer);
		}
		return null;
	}
	
	public boolean hasNext(){
		return currentOffer<offers.size();
	}
	
}
