package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForPerson;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/GetDocument")
public class GetDocument extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDocument() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		DataForPerson dp = new DataForPerson();
		byte [] file;
		if (name  != null) {
			file = dp.getDocument(id,name);
		} else {
			file = dp.getCV(id);
		}
		
		if(file==null || file.length==0){
		//	request.getSession().setAttribute("file", "NO CV FOUND");
			response.setContentType("text/html");
			response.getWriter().print("<html><h1 style=\"text-allign: center;\">Upload Cv If You Want</h1><html>");
		}else{ 
			request.getSession().setAttribute("file", file);
			RequestDispatcher rd=request.getRequestDispatcher("GetFile?type=application/pdf");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
