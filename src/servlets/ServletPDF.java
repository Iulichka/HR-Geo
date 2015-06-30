package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import backClasses.DataForPerson;
import backClasses.OverallExperience;
import backClasses.Person;
import backClasses.PersonEducation;
import backClasses.PersonSkills;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class ServletPDF
 */
@WebServlet("/ServletPDF")
public class ServletPDF extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletPDF() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
			return;
		}

		
		String id = request.getParameter("id");
		DataForPerson dfp = new DataForPerson();
		int intId = Integer.parseInt(id);
		dfp.getPerson(intId);
		Person per = dfp.getPerson(intId);
		OverallExperience exp = dfp.getPersonExperience(intId);
		PersonSkills skills = dfp.getPersonSkills(intId);
		PersonEducation edu = dfp.getPersonEducation(intId);
		

		response.setContentType("application/pdf");
		response.addHeader("Content-Disposition", "attachment; filename=iulia_created.pdf");
		
		try {
			// step 1
			Document document = new Document();
			// step 2
			PdfWriter.getInstance(document, response.getOutputStream());
			// step 3
			document.open();
			// step 4
			
			document.add(new Paragraph("Hello World"));
			document.add(new Paragraph(new Date().toString()));
			
			
			
			document.add(new Paragraph("Personal Statistics"));
			String name = per.getName() +" ";
			name += per.getSurname();
			document.add(new Paragraph(name));
			String gender = "Gender: "; 
			gender += per.getSex();
			document.add(new Paragraph(gender));
			String dateof = "Date of Birth: " ;
			dateof += per.getDate().toString();		
			document.add(new Paragraph(dateof));
			String mail = "Email Adress: ";
			mail +=	per.getMail();	
			document.add(new Paragraph(mail));
			
			
			document.add(new Paragraph("Education"));
			
			// step 5
			document.close();
		} catch (DocumentException de) {
			throw new IOException(de.getMessage());
		}

		final long serialVersionUID = 4262544639420765610L;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

}
