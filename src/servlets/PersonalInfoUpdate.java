package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.ParsePosition;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import backClasses.DBSelect;
import backClasses.DataForPerson;
import backClasses.Person;

/**
 * Servlet implementation class PersonalInfoUpdate
 */
@WebServlet("/PersonalInfoUpdate")
public class PersonalInfoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalInfoUpdate() {
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
		String sessionMail=(String)request.getSession().getAttribute("email");
		String name=(String) request.getParameter("first_name");
		String lastName=(String)request.getParameter("last_name");
		String email=(String)request.getParameter("email");
		String currentPassword=(String)request.getParameter("current_password");
		String password=(String)request.getParameter("password");
		String confirmPassword=(String)request.getParameter("password_confirm");
		String date=(String)request.getParameter("date");
		DataForPerson data=new DataForPerson();
		Person currentPerson=data.getPerson(data.getPersonId(sessionMail));
		if(name!=null)currentPerson.setName(name);
		if(lastName!=null) currentPerson.setSurname(lastName);
		if(email!=null){
			currentPerson.setMail(email);
		}
		if(date!=null){
			int year=Integer.parseInt(date.substring(0,4));
			int day=Integer.parseInt(date.substring(8));
			int month=Integer.parseInt(date.substring(5,7));
			Date d=new GregorianCalendar(year, month-1, day).getTime();
			//currentPerson.setDate(date);
		}
		Boolean changePassword=false;
		DBSelect db=new DBSelect();
		if(db.searchPerson(sessionMail, currentPassword)){
			if(password!=null && password.equals(confirmPassword)){
				changePassword=true;
			}
		}
		data.updatePerson(currentPerson, password, changePassword, sessionMail);
		HttpSession ses=request.getSession();
		ses.setAttribute("email", currentPerson.getMail());
		ses.setAttribute("person", currentPerson);
		response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");
	}

}
