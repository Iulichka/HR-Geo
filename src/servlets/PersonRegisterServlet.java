package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DBSelect;
import backClasses.Person;

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
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String first_name=(String)request.getParameter("first_name");
		String surname=(String)request.getParameter("last_name");
		String id=(String)request.getParameter("id_number");
		String password_confirm=(String)request.getParameter("password_confirmation");
		String sex=(String)request.getParameter("inlineRadioOptions");
		String year=(String)request.getParameter("year");
		String month=(String)request.getParameter("month");
		String day=(String)request.getParameter("day");
		Date date=new Date(Integer.parseInt(year),Integer.parseInt(month), Integer.parseInt(day));
		Person person=new Person(first_name, email, surname, id, password,sex,date);		
		DBSelect selects= new DBSelect();
		try {
			boolean contains=selects.searchPerson(person);			
			if(contains==true||password==null||!password.equals(password_confirm)){
				RequestDispatcher rd=request.getRequestDispatcher("personRegister.jsp");
				rd.forward(request, response);
			}else{
				selects.addPerson(person);
				RequestDispatcher rd=request.getRequestDispatcher("personProfile.jsp");
				rd.forward(request, response);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
