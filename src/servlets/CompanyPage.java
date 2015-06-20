package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForComp;

/**
 * Servlet implementation class CompanyPage
 */
@WebServlet("/CompanyPage")
public class CompanyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("comp", new DataForComp().getComp(request.getParameter("mail")));
		RequestDispatcher rd=request.getRequestDispatcher("CompanyPage.jsp");
		rd.forward(request, response);		
	/*	response.setContentType("text/html");	
		response.setCharacterEncoding("UTF-8");
		PrintWriter w = response.getWriter();
		w.println("<body>");
		w.println(new DataForComp().getComp(request.getParameter("mail")).getName());	
		w.println("</body>");
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
