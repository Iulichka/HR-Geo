package servlets;

import java.io.IOException;
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
			try {
				boolean contains =selects.searchPerson(email,password);
				if(contains==false){
					RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
					rd.forward(request,response);
				}else{
					HttpSession session=request.getSession();
					session.setAttribute("email", email);
					Cookie userName=new Cookie("email",email);
					response.addCookie(userName);
					//RequestDispatcher rd=request.getRequestDispatcher("personProfile.jsp");
					//rd.forward(request, response);
					response.sendRedirect("personProfile.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			try {
				boolean contains=selects.searchCompany(email,password);
				if(contains==false){
					RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
					rd.forward(request,response);
				}else{
					RequestDispatcher rd=request.getRequestDispatcher("companyProfile.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
