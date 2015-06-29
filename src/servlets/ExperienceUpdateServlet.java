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
			return;
		}
		DataForPerson data=new DataForPerson();
		int expId=Integer.parseInt(request.getParameter("exp_id"));
		String dateStart=request.getParameter("start_date");
		String dateEnd=request.getParameter("end_date");
		Date dStart=null;
		Date eDate=null;
		String requestType=request.getParameter("SUBMIT");
		if(dateStart!=null && dateStart.length()==10 && !requestType.equals("delete")){
			int year=Integer.parseInt(dateStart.substring(0,4));
			int day=Integer.parseInt(dateStart.substring(8));
			int month=Integer.parseInt(dateStart.substring(5,7));
			dStart=new GregorianCalendar(year, month-1, day).getTime();
		}else if(!requestType.equals("delete")) {
			response.sendRedirect("experienceUpdate.jsp");
			return;
		}	
		
		if(dateEnd!=null && dateEnd.length()==10){
			int year=Integer.parseInt(dateEnd.substring(0,4));
			int day=Integer.parseInt(dateEnd.substring(8));
			int month=Integer.parseInt(dateEnd.substring(5,7));
			eDate=new GregorianCalendar(year, month-1, day).getTime();
		}
		
		if(requestType.equals("change")){
			data.changeExperience(expId,dStart,eDate);
		}else{
			data.deleteExp(expId);
		}	
		response.sendRedirect("experienceUpdate.jsp");
		
	}

}
