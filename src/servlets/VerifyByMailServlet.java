package servlets;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.EMailSender;

/**
 * Servlet implementation class VerifyByMailServlet
 */
@WebServlet("/VerifyByMailServlet")
public class VerifyByMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyByMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Random r = new Random( System.currentTimeMillis() );
		String code = ""+10000 + r.nextInt(20000);
		request.getSession().setAttribute("code", code);
		EMailSender.sendEmail(request.getParameter("email"),code,"hrgeofreeuni@gmail.com","hrgeofreeuni1");
		request.getRequestDispatcher("activation.jsp").forward(request,response);
	}

}
