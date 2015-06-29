package servlets;

import java.io.IOException;
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
		response.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		String currentEmail=(String)session.getAttribute("email");
		String updatedEmail=(String)request.getParameter("email");
		String name=(String)request.getParameter("name");
		String tel=(String)request.getParameter("tel");
		String site=(String)request.getParameter("site");
		String password=(String)request.getParameter("password");
		String passwordConfirm=(String)request.getParameter("password_confirm");
		String currentPassword=(String)request.getParameter("current_password");
		String about=(String)request.getParameter("about");
		DBSelect select=new DBSelect();
		if(updatedEmail.length()>0){
			select.changeCompanyEmail(currentEmail, updatedEmail);
		}
		if(site.length()>0){
			select.changeCompanySite(currentEmail, site);
		}
		
		if(tel.length()>0){
			select.changeCompanyTel(currentEmail, tel);
		}
			
		if(password.length()>0&&password.equals(passwordConfirm)&&select.searchCompany(currentEmail, currentPassword)){
			select.changeCompanyPass(currentEmail, password);
		}
		if(name.length()>0){
			select.changeCompanyName(currentEmail, name);
		}
		if(about.length()>0){
			select.changeCompanyInfo(currentEmail ,about);
		}
			
		response.sendRedirect("http://localhost:8080/HR-Geo/CompanyServlet");
		
		
		
	}

}
