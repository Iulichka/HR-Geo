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
		String  selectedUniversity=(String)request.getParameter("university");
		String  selectedFaculty=(String)request.getParameter("faculty");
		String age=(String)request.getParameter("age");
		String experience=(String)request.getParameter("experience");
		boolean uniSearch=true;
		boolean facSearch=true;
		boolean skillSearch=true;
		boolean ageSearch=true;
		boolean experienceSearch=true;
		String university=null;
		String faculty=null;
		int personAge=0;
		int workingExperience=0;
		if(Integer.parseInt(selectedUniversity)==0){
			uniSearch=false;
		}
		if(Integer.parseInt(selectedFaculty)==0){
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
		DataForPerson p= new DataForPerson();
		ArrayList<String> chosenSkills = new ArrayList<String>();
		ArrayList<String> skillNames =p.getSkillNames();
		ArrayList<String> universityNames =p.getUniversityNames();
		ArrayList<String> facultyNames =p.getFacultyNames();
		if(uniSearch){
			university = universityNames.get(Integer.parseInt(selectedUniversity)-1);
		}
		if(facSearch){
			faculty = facultyNames.get(Integer.parseInt(selectedFaculty)-1);
		}
		if(skillSearch){
			for(int i=0;i<selectedSkill.length;i++){
				chosenSkills.add(skillNames.get(Integer.parseInt(selectedSkill[i])-1));
			}
		}
		if(ageSearch){
			personAge=Integer.parseInt(age);
		}
		if(experienceSearch){
			workingExperience=Integer.parseInt(experience);
		}
	}

}
