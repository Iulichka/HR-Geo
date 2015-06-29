package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DBSelect;
import backClasses.DataForPerson;
import backClasses.Person;

/**
 * Servlet implementation class OfferAnswer
 */
@WebServlet("/OfferAnswer")
public class OfferAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OfferAnswer() {
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
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
		}
		DBSelect select=new DBSelect();
		DataForPerson data=new DataForPerson();
		Person  pers=(Person)request.getSession().getAttribute("person");
		int offer_id=Integer.parseInt(request.getParameter("offer_id"));
		String type=request.getParameter("SUBMIT");
		if(type.equals("page")){
			request.setAttribute("offerid", offer_id);
			request.setAttribute("person",pers);
			RequestDispatcher rd=request.getRequestDispatcher("personOffer.jsp");
			rd.forward(request, response);
		}else{
			select.changeOfferStatus(data.getPersonId(pers.getMail()), offer_id, type);
			response.sendRedirect("http://localhost:8080/HR-Geo/PersonServlet");

		}
	}

}
