package servlets;

import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.naming.java.javaURLContextFactory;

import backClasses.DBSelect;
import backClasses.DataForPerson;
import backClasses.EMailSender;
import backClasses.MessageSender;
import backClasses.Person;

/**
 * Servlet implementation class VerifyByMailServlet
 */
@WebServlet("/VerifyByMailServlet")
public class VerifyByMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyByMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String password_confirm=(String)request.getParameter("password_confirmation");
		String first_name=(String)request.getParameter("first_name");
		String surname=(String)request.getParameter("last_name");
		String id=(String)request.getParameter("id_number");
		String sex=request.getParameter("inlineRadioOptions");
		String dateS = request.getParameter("date");		
		int year=Integer.parseInt(dateS.substring(0,4));
		int day=Integer.parseInt(dateS.substring(8));
		int month=Integer.parseInt(dateS.substring(5,7));
		Date d=new GregorianCalendar(year, month-1, day).getTime();
		java.sql.Date da=new java.sql.Date(year, month-1, day);
		DBSelect selects= new DBSelect();
		try {			
			boolean contains=selects.searchPerson(email,password);	
			if(contains==true){
				RequestDispatcher rd= request.getRequestDispatcher("homePage.jsp");
				rd.forward(request, response);
			}
				HttpSession session = request.getSession(false);			        
			    if(session != null){
			        session.invalidate();
			    }
			    session=request.getSession();
				session.setAttribute("first_name", first_name);
				session.setAttribute("last_name", surname);
				session.setAttribute("email", email);
				session.setAttribute("date", da);
				session.setAttribute("sex", sex);
				session.setAttribute("id", id);
				session.setAttribute("password", password);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Random r = new Random( System.currentTimeMillis() );
		String code = ""+10000 + r.nextInt(20000);
		request.getSession().setAttribute("code", code);
		EMailSender.sendEmail(request.getParameter("email"), code);
		request.getRequestDispatcher("Activation.jsp").forward(request,response);
		
	}

}
