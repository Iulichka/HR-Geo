package backClasses;
import java.lang.*;
import java.util.ArrayList;
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
