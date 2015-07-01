package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GoToPersonPage
 */
@WebServlet("/GoToPersonPage")
public class GoToPersonPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToPersonPage() {
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
		if((String)request.getParameter("person_id")!=null){
			String id = (String)request.getParameter("person_id");
			String state= (String)request.getParameter("offer_status");
			String type;
			if(state.equals("success")) {
				type = "open";
			} else {
				type = "closed";
			}
			response.sendRedirect("PersonPage?id="+id+"&type="+type);
		}
	}

}
