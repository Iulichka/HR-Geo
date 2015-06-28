package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EducationUpdateServlet
 */
@WebServlet("/EducationUpdateServlet")
public class EducationUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EducationUpdateServlet() {
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
		int k=5;
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
		}
		String universityName=request.getParameter("university");
		String facultyName=request.getParameter("faculty");
		int gradYear=Integer.parseInt(request.getParameter("year"));
		String gradType=request.getParameter("grad_type");
		String requestType=request.getParameter("SUBMIT");
		while(true){
			//System.out.println(universityName);
		}
	
	}

}
