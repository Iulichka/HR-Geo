package servlets;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backClasses.DataForComp;
import backClasses.Person;




/**
 * Servlet implementation class GetFile
 * this servlet gets "file" attribute from  session and sends it back
 * attribute is removed after sending
 * type parameter is file type like "text/html"
 */
@WebServlet("/GetFile")
public class GetFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * this servlet gets "file" attribute from  session and sends it back
	 * attribute is removed after sending
	 * type parameter is file type like "text/html"
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileType = request.getParameter("type");
		response.setContentType(fileType);
		byte [] file = (byte[]) request.getSession().getAttribute("file");
		request.removeAttribute("file");
		response.setContentLength(file.length);
		OutputStream out = response.getOutputStream();
		//System.out.println(request.getSession().getAttributeNames());
		//System.out.println(file.length);
		out.write(file);
	}

}
