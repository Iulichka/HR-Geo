package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForPerson;
import backClasses.Person;

/**
 * Servlet implementation class ExperienceUpdateServlet
 */
@WebServlet("/ExperienceUpdateServlet")
public class ExperienceUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExperienceUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
		}
		DataForPerson data=new DataForPerson();
		int expId=Integer.parseInt(request.getParameter("exp_id"));
		Person p=(Person) request.getSession().getAttribute("person");
		int personId=Integer.parseInt(p.getId());
		String comName=request.getParameter("company_name");
		String posName=request.getParameter("pos_name");
		
		
	}

}
