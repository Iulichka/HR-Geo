package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.Company;
import backClasses.DBSelect;
import backClasses.DataForComp;

/**
 * Servlet implementation class MakeFinalOffer
 */
@WebServlet("/MakeFinalOffer")
public class MakeFinalOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeFinalOffer() {
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
		ArrayList<Integer> cart= (ArrayList<Integer>)request.getSession().getAttribute("cart");
		String email=(String)request.getSession().getAttribute("email");
		DataForComp data= new DataForComp();
		Company company=data.getComp(email);
		String offerName = (String)request.getParameter("offer_name");
		String offerInfo=(String)request.getParameter("about");
		String date=(String)request.getParameter("date");
		Date d=null;
		DBSelect select=new DBSelect();
		if(date!=null && date.length()==10){
			int year=Integer.parseInt(date.substring(0,4));
			int day=Integer.parseInt(date.substring(8));
			int month=Integer.parseInt(date.substring(5,7));
			d=new GregorianCalendar(year, month-1, day).getTime();
		}
		select.addOfferToPersons(company, offerInfo, offerName, d, cart);
		response.sendRedirect("CompanyServlet");
		
		
		
	}

}
