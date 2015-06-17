package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;




import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		String sex=(String)request.getParameter("inlineRadioOptions");
		int year=Integer.parseInt((String)request.getParameter("year"));
		int month=Integer.parseInt((String)request.getParameter("month"));
		int day=Integer.parseInt((String)request.getParameter("day"));
		@SuppressWarnings("deprecation")
		Date date=new Date(day,month,year);		
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
				selects.addPerson(first_name, surname, password, id, date, email, sex);
				session=request.getSession();
				session.setAttribute("email", email);
				Cookie userName=new Cookie("email",email);
				response.addCookie(userName);
				response.sendRedirect("personProfile.jsp");			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
