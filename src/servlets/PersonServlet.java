package servlets;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.DBSelect;
import backClasses.DataForPerson;

import backClasses.OverallExperience;
import backClasses.Person;
import backClasses.PersonEducation;
import backClasses.PersonSkills;

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
		DBSelect selects=new DBSelect();
		HttpSession session=request.getSession();
		String email= (String)session.getAttribute("email");
		int id=0;
		try {
			id = selects.getPersonId(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DataForPerson data=new DataForPerson();
		Person person = data.getPerson(id);
		PersonSkills skills=data.getPersonSkills(id);
		OverallExperience experience=data.getPersonExperience(id);
		PersonEducation edu=data.getPersonEducation(id);
		request.setAttribute("person", person);
		request.setAttribute("skills", skills);
		request.setAttribute("experience", experience);
		request.setAttribute("education", edu);
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
