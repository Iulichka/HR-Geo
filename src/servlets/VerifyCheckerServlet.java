package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DBSelect;
import backClasses.DataForPerson;
import backClasses.EMailSender;
import backClasses.Person;

/**
 * Servlet implementation class VerifyCheckerServlet
 */
@WebServlet("/VerifyCheckerServlet")
public class VerifyCheckerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCheckerServlet() {
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
		if(!request.getParameter("code").equals(request.getSession().getAttribute("code"))){
			Random r = new Random( System.currentTimeMillis() );
			String code = ""+10000 + r.nextInt(20000);
			request.getSession().setAttribute("code", code);
			EMailSender.sendEmail(request.getParameter("email"), code);
			request.getRequestDispatcher("illegalRegister.jsp").forward(request, response);
		}else{
			DBSelect select=new DBSelect();
			select.addPerson((String)request.getSession().getAttribute("first_name"),(String) request.getSession().getAttribute("last_name"),(String)request.getSession().getAttribute("password"),(String) request.getSession().getAttribute("id"), (Date)request.getSession().getAttribute("date"), (String)request.getSession().getAttribute("email"),(String)request.getSession().getAttribute("sex"));
			DataForPerson person= new DataForPerson();
			Person p=person.getPerson(person.getPersonId((String)request.getSession().getAttribute("email")));
			request.getSession().setAttribute("person",p);
			response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");
		}
	}

}
