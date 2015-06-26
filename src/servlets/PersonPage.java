package servlets;

import java.io.IOException;
import java.nio.channels.OverlappingFileLockException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DBSelect;
import backClasses.DataForPerson;
import backClasses.OverallExperience;
import backClasses.Person;
import backClasses.PersonEducation;
import backClasses.PersonSkills;

/**
 * Servlet implementation class PersonPage
 */
@WebServlet("/PersonPage")
public class PersonPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * this servlet needs person Id and Type as parameters to create person and show it 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id==null) id = "1"; // temp
		String type = request.getParameter("type");
		if(type == null) type = "open"; // temp
		DataForPerson dfp = new DataForPerson();
		int intId = Integer.parseInt(id);
		dfp.getPerson(intId);
		Person per = dfp.getPerson(intId);
		OverallExperience exp = dfp.getPersonExperience(intId);
		PersonSkills skills = dfp.getPersonSkills(intId);
		PersonEducation edu = dfp.getPersonEducation(intId);
		request.setAttribute("person", per);
		request.setAttribute("experience", exp);
		request.setAttribute("skills", skills);
		request.setAttribute("education", edu);
		request.getSession().setAttribute("file", per.getPhoto());
		String rightJsp = "";
		if (type.equals("open")) {
			rightJsp = "PersonPage.jsp";
		} else if(type.equals("closed")) {
			rightJsp = "PersonPageClosed.jsp";	
		}
		RequestDispatcher rd=request.getRequestDispatcher(rightJsp);
		rd.forward(request, response);
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
