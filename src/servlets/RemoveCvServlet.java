package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForPerson;

/**
 * Servlet implementation class RemoveCvServlet
 */
@WebServlet("/RemoveCvServlet")
public class RemoveCvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCvServlet() {
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
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
			return;
		}
		DataForPerson data=new DataForPerson();
		int perId=Integer.parseInt(request.getParameter("person_id"));
		data.deleteCv(perId);
		response.sendRedirect("updateDocuments.jsp");
		
	}

}
