package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import backClasses.Company;
import backClasses.DBSelect;
import backClasses.DataForPerson;
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
		DBSelect selects=new DBSelect();
		if(checked==null){
			boolean contains =selects.searchPerson(email,password);
			if(contains==false){
				RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
				rd.forward(request,response);
			}else{
				HttpSession session = request.getSession(false);			        
			    if(session != null){
			        session.invalidate();
			    }
			    session=request.getSession();
			    DataForPerson data=new DataForPerson();
			    Person p=data.getPerson(data.getPersonId(email));			    
			    session.setAttribute("person", p);
				session.setAttribute("email", email);
				session.setAttribute("first_name",p.getName() );
				session.setAttribute("last_name", p.getSurname());
				response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");
			}			
		}else{
			boolean contains=selects.searchCompany(email,password);
			if(contains==false){
				RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
				rd.forward(request,response);
			}else{
				HttpSession session = request.getSession(false);			        
			    if(session != null){
			        session.invalidate();
			    }
			    session=request.getSession();
			    Company company=selects.getCompany(selects.getCompanyId(email));			 
				session.setAttribute("email", email);
				session.setAttribute("company", company);
				response.sendRedirect("http://localhost:8080/HR-Geo/CompanyServlet");
			}
		}
	}

}
