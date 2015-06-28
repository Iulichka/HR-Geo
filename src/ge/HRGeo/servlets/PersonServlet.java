package ge.HRGeo.servlets;
import ge.HRGeo.backClasses.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email= (String)session.getAttribute("email");
		DataForPerson data=new DataForPerson();
		int id=0;
		id = data.getPersonId(email);
		
		
		Person person = data.getPerson(id);
		PersonSkills skills=data.getPersonSkills(id);
		OverallExperience experience=data.getPersonExperience(id);
		PersonEducation edu=data.getPersonEducation(id);
		AllOffersForPerson offers=data.getOffers(id);
		request.setAttribute("person", person);
		request.setAttribute("skills", skills);
		request.setAttribute("experience", experience);
		request.setAttribute("education", edu);
		request.setAttribute("offers", offers);
		RequestDispatcher rd = request.getRequestDispatcher("personProfile.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
