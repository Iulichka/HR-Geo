package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.DBSelect;

/**
 * Servlet implementation class CompanyUpdateServlet
 */
@WebServlet("/CompanyUpdateServlet")
public class CompanyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyUpdateServlet() {
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
		HttpSession session=request.getSession();
		String currentEmail=(String)session.getAttribute("email");
		String updatedEmail=(String)request.getAttribute("email");
		String name=(String)request.getAttribute("name");
		String tel=(String)request.getAttribute("tel");
		String site=(String)request.getAttribute("site");
		String password=(String)request.getAttribute("password");
		String passwordConfirm=(String)request.getAttribute("password_confirm");
		DBSelect select=new DBSelect();
		if(updatedEmail!=null){
			select.changeCompanyEmail(currentEmail, updatedEmail);
		}
		if(site!=null){
			select.changeCompanySite(currentEmail, site);
		}
		
		if(tel!=null){
			select.changeCompanyTel(currentEmail, tel);
		}
			
		if(password!=null&&password.equals(passwordConfirm)){
			select.changeCompanyPass(currentEmail, password);
		}
		if(name!=null){
			select.changeCompanyName(currentEmail, name);
		}
				
		response.sendRedirect("http://localhost:8080/HR-Geo/CompanyServlet");
		
		
	}

}
