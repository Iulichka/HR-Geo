package servlets;

import java.io.IOException;
import java.sql.SQLException;




import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.DBSelect;


/**
 * Servlet implementation class PersonRegisterServlet
 */
@WebServlet("/PersonRegisterServlet")
public class PersonRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonRegisterServlet() {
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
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String password_confirm=(String)request.getParameter("password_confirmation");
		String first_name=(String)request.getParameter("first_name");
		String surname=(String)request.getParameter("last_name");
		String id=(String)request.getParameter("id_number");
		String sex=request.getParameter("inlineRadioOptions");
		int year=Integer.parseInt(request.getParameter("year"));
		int month=Integer.parseInt(request.getParameter("month"));
		int day=Integer.parseInt(request.getParameter("day"));
		Date date = new GregorianCalendar(year, month, day).getTime();
		//Date date=new Date(day,month,year);		
		DBSelect selects= new DBSelect();
		try {
			boolean contains=selects.searchPerson(email,password);			
			if(contains==true||password==null
					||password_confirm==null||!password.equals(password_confirm)||surname==null||email==null||first_name==null){
				RequestDispatcher rd=request.getRequestDispatcher("personRegister.jsp");
				rd.forward(request, response);
			}else{
				  HttpSession session = request.getSession(false);			        
			        if(session != null){
			            session.invalidate();
			        }
				selects.addPerson(first_name, surname, password, id, new java.sql.Date(date.getTime()), email, sex);
				session=request.getSession();
				session.setAttribute("first_name", first_name);
				session.setAttribute("last_name", surname);
				session.setAttribute("email", email);
				response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
