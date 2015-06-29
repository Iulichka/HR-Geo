package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForPerson;
import backClasses.Person;

/**
 * Servlet implementation class ExperienceAddServlet
 */
@WebServlet("/ExperienceAddServlet")
public class ExperienceAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExperienceAddServlet() {
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
		String comName=request.getParameter("company_name");
		String posName=request.getParameter("postition_name");
		Person p=(Person) request.getSession().getAttribute("person");
		int persId=Integer.parseInt(p.getId());
		String dateStart=request.getParameter("start_date");
		String dateEnd=request.getParameter("end_date");
		Date dStart=null;
		Date eDate=null;
		String requestType=request.getParameter("SUBMIT");
		int year=Integer.parseInt(dateStart.substring(0,4));
		int day=Integer.parseInt(dateStart.substring(8));
		int month=Integer.parseInt(dateStart.substring(5,7));
		dStart=new GregorianCalendar(year, month-1, day).getTime();	
		if(dateEnd!=null && dateEnd.length()==10){
			int y=Integer.parseInt(dateEnd.substring(0,4));
			int d=Integer.parseInt(dateEnd.substring(8));
			int m=Integer.parseInt(dateEnd.substring(5,7));
			eDate=new GregorianCalendar(y, m-1, d).getTime();
		}
		data.addExperience(persId,comName,posName,dStart,eDate);
		
		response.sendRedirect("experienceUpdate.jsp");
		
		
	}

}
