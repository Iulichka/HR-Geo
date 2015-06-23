package servlets;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.Company;
import backClasses.DataForComp;

/**
 * Servlet implementation class CompImage
 */
@WebServlet("/CompImage")
public class CompImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		String mail = request.getParameter("mail");
		int n = Integer.parseInt(request.getParameter("num"));
		DataForComp dat = new DataForComp();
		byte [] pic = dat.getCompPic(mail, n);
		response.setContentLength(pic.length);
		OutputStream out = response.getOutputStream();
		System.out.println(pic.length);
		out.write(pic);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
