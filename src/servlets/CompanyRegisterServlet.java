package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import backClasses.DBSelect;

/**
 * Servlet implementation class CompanyRegisterServlet
 */
@WebServlet("/CompanyRegisterServlet")
public class CompanyRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyRegisterServlet() {
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
		String name=(String)request.getParameter("company_name");
		String site=(String)request.getParameter("site");
		String tel=(String)request.getParameter("tel");
		DBSelect selects= new DBSelect();
		boolean contains=selects.searchCompany(email,password);	
		if(contains==true||password.length()==0||email.length()==0||tel.length()==0||site.length()==0||name.length()==0){
			RequestDispatcher rd=request.getRequestDispatcher("companyRegister.jsp");
			rd.forward(request, response);
		}else{
			selects.addCompany(name, email, password, tel, site);
			RequestDispatcher rd=request.getRequestDispatcher("companyProfile.jsp");
			rd.forward(request, response);				
		}
		
	}

}
