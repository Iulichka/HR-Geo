package servlets;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForComp;
import backClasses.DataForPerson;

/**
 * Servlet implementation class GetPersonPicture
 */
@WebServlet("/GetPersonPicture")
public class GetPersonPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPersonPicture() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		String id = request.getParameter("id");
		DataForPerson dat = new DataForPerson();
		byte [] pic = dat.getPhoto(Integer.parseInt(id));
		if (pic == null){
			//response.sendRedirect("http://dogvacay.com/img/default_profile.jpg");
			response.sendRedirect("pagePictures/default_profile.jpg");
			return;
		}
		response.setContentLength(pic.length);
		OutputStream out = response.getOutputStream();
		System.out.println(pic.length);
		out.write(pic);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	}

}
