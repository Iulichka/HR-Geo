package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.DataForPerson;
import backClasses.PersonSearcher;

/**
 * Servlet implementation class MakeOfferServlet
 */
@WebServlet("/MakeOfferServlet")
public class MakeOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeOfferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] selectedSkill=(String[])request.getParameterValues("skills");
		String []  selectedUniversity=(String[])request.getParameterValues("university");
		String [] selectedFaculty=(String[])request.getParameterValues("faculty");
		String age=(String)request.getParameter("age");
		String experience=(String)request.getParameter("experience");
		boolean uniSearch=true;
		boolean facSearch=true;
		boolean skillSearch=true;
		boolean ageSearch=true;
		boolean experienceSearch=true;
		int personAge=0;
		int workingExperience=0;
		if(selectedUniversity.length<1){
			uniSearch=false;
		}
		if(selectedFaculty.length<1){
			facSearch=false;
		}
		if(selectedSkill.length<1){
			skillSearch=false;
		}
		if(age.length()==0){
			ageSearch=false;
		}
		if(experience.length()==0){
			experienceSearch=false;
		}
		PersonSearcher searcher=new PersonSearcher();
		ArrayList<Integer> chosenSkillsIds = new ArrayList<Integer>();
		ArrayList<Integer> chosenUnisIds=new ArrayList<Integer>();
		ArrayList<Integer> chosenFacultyIds=new ArrayList<Integer>();
		
		if(uniSearch){
			for(int i=0;i<selectedUniversity.length;i++){
				try{
					int id=Integer.parseInt(selectedUniversity[i]);
				chosenUnisIds.add(id);
				}catch(Exception e){
					e.getMessage();
				}
			}
		}
		if(facSearch){
			for(int i=0;i<selectedFaculty.length;i++){
				try{
					int id=Integer.parseInt(selectedFaculty[i]);
				chosenFacultyIds.add(id);
				}catch(Exception e){
					e.getMessage();
				}
			}
		}
		if(skillSearch){
			for(int i=0;i<selectedSkill.length;i++){
				try{
					int id=Integer.parseInt(selectedSkill[i]);
				chosenSkillsIds.add(id);
				}catch(Exception e){
					e.getMessage();
				}
			}
		}
		if(ageSearch){
			personAge=Integer.parseInt(age);
		}
		if(experienceSearch){
			workingExperience=Integer.parseInt(experience);
		}
		ArrayList<Integer> personIds=searcher.getPersons(chosenUnisIds,chosenFacultyIds,chosenSkillsIds,personAge,workingExperience);
		
		
		
	}

}
