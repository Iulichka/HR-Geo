package backClasses;

public class Education {
	private String uni;
	/** this is graduation type,bachelor ,master or 3rd course etc.
	 * 
	 */
	private String lvl;
	private String faculty;
	private int end;
	
	public Education(String uni,String level,int end,String faculty){
		this.uni=uni;
		this.lvl=level;
		this.end=end;
		this.faculty=faculty;
	}
	
	public String getUniversity(){
		return uni;
	}
	
	
	public int getEndYear(){
		return end;
	}
	
	
	public String getLevel(){
		return lvl;
	}
	;
	
	public String getFaculty(){
		return faculty;
	}
	
	
	public void setUniversity(String uni){
		this.uni=uni;
	}
	
	
	
	public void setEndYear(int year){
		end=year;
	}
	
	
	public void setLevel(String lvl){
		this.lvl=lvl;
	}
	
	
	public void setFaculty(String faculty){
		this.faculty=faculty;
	}
}
