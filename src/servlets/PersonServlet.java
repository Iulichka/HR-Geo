package servlets;
import backClasses.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homePage.jsp");
			return;
		}
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
