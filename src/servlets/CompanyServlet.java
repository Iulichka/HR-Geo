package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.Company;
import backClasses.DBSelect;
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
		HttpSession session=request.getSession();
		String email= (String)session.getAttribute("email");
		int id=0;
		DBSelect select=new DBSelect();
		ArrayList<Offer> offers=new ArrayList<Offer>();
		HashMap<Offer,ArrayList<Person> > map = new HashMap<Offer, ArrayList<Person>>();
		Company company=null;
		try {
			id=select.getCompanyId(email);
			company=select.getCompany(id);
			offers=select.getCompanyOffers(id);
			for(int i=0;i<offers.size();i++){
				map.put(offers.get(i), select.getOfferPersons(offers.get(i).getOfferID()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("offers",map);
		request.setAttribute("company", company);
		RequestDispatcher rd = request.getRequestDispatcher("companyProfile.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
