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
 * Servlet implementation class EducationAddServlet
 */
@WebServlet("/EducationAddServlet")
public class EducationAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EducationAddServlet() {
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
			return;
		}
		DataForPerson data=new DataForPerson();
		Person p=(Person)request.getSession().getAttribute("person");
		int persId=Integer.parseInt(p.getId());
		String uni=request.getParameter("university");
		String faculty=request.getParameter("faculty");
		int year=0;
		try{
			year=Integer.parseInt(request.getParameter("year"));
		}catch (Exception e){
			response.sendRedirect("educationUpdate.jsp");
			return;
		}
		String gradType=request.getParameter("grad_type");
		data.addEducation(persId,uni,faculty,year,gradType);
		
		response.sendRedirect("educationUpdate.jsp");
	}

}
