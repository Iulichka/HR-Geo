package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import backClasses.DataForComp;
import backClasses.DataForPerson;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
@MultipartConfig
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// change it according OS

	private static final String FILE_PATH = "D:";


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 * if mail parameter exists considered as company otherwise as person
	 */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	response.setContentType("text/plain");
	    	String mail = request.getParameter("mail");
	    	String id = request.getParameter("id");
	    	String type = request.getParameter("type");
	        String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
	        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
//	        String fileName = filePart.getSubmittedFileName();
	        InputStream fileContent = filePart.getInputStream();
	        File file = new File(FILE_PATH+"/that.jpg");
	        OutputStream outputStream = new FileOutputStream(file);
	        IOUtils.copy(fileContent, outputStream);
	        FileInputStream inputStream= new FileInputStream(file);
	        outputStream.close();
	        if(("document").equals(type)) {
	        	DataForPerson dp = new DataForPerson();
	        	dp.addDocument(id,description,inputStream);
	        } else if (("cv").equals(type)) {
	        	DataForPerson dp = new DataForPerson();
	        	dp.addCV(id,inputStream);
	        } else  {
		        if (id==null && mail!=null) {
			        DataForComp d = new DataForComp();
			        d.addPicture(mail, inputStream);
		        } else if(id!=null) {
		        	DataForPerson dp = new DataForPerson();
		        	dp.addPicture(id, inputStream);
		        }
	        }
	        inputStream.close();
	        file.delete();
	        response.getWriter().print("file: "+description+" was successfully uploaded");
	  }

}
