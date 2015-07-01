package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.Company;
import backClasses.DBSelect;
import backClasses.DataForComp;

import backClasses.Offer;
import backClasses.Person;

/**
 * Servlet implementation class CompanyServlet
 */
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if(request.getSession()==null||request.getSession().getAttribute("person")!=null){
			RequestDispatcher rd=request.getRequestDispatcher("homePage.jsp");
			rd.forward(request, response);
		}
		HttpSession session=request.getSession();
		String email= (String)session.getAttribute("email");
		DBSelect select= new DBSelect();
		ArrayList<Offer> offers=new ArrayList<Offer>();
		ArrayList<Person> persons=new ArrayList<Person>();
		Map<Offer,ArrayList<Person> > map = new HashMap<Offer, ArrayList<Person>>();
		DataForComp data=new DataForComp();
		Company company=data.getComp(email);
		int companyID=select.getCompanyId(email);
		offers=select.getCompanyOffers(companyID);						 	
	    for(int i=0;i<offers.size();i++){
	    	  persons=select.getOfferPersons(offers.get(i).getOfferID());
	    	  map.put(offers.get(i), persons);
	      }
		request.setAttribute("company", company);
		request.setAttribute("offers", map);
		RequestDispatcher rd=request.getRequestDispatcher("companyProfile.jsp");
		rd.forward(request, response);
			
		
						
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
