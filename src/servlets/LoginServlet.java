package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import backClasses.Company;
import backClasses.DBSelect;
import backClasses.Person;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
       
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		String checked =(String)request.getParameter("check");
		Person person=new Person(" ",email," ",0,null,password);
		DBSelect selects=new DBSelect();
		if(!checked.equals("Company")){
			try {
				boolean contains =selects.searchPerson(person);
				if(contains==false){
					RequestDispatcher rd=request.getRequestDispatcher("signin.jsp");
					rd.forward(request,response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("personPage.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			Company company=new Company(" ", " ", " ", email, " "," ", 0, password);
			try {
				boolean contains=selects.searchCompany(company);
				if(contains==false){
					RequestDispatcher rd=request.getRequestDispatcher("signin.jsp");
					rd.forward(request,response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("companyPage.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
