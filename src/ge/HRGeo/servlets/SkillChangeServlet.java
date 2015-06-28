package ge.HRGeo.servlets;

import ge.HRGeo.backClasses.DataForPerson;
import ge.HRGeo.backClasses.Person;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

/**
 * Servlet implementation class SkillChangeServlet
 */
@WebServlet("/SkillChangeServlet")
public class SkillChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SkillChangeServlet() {
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
		if(request.getSession().getAttribute("person")==null){
			response.sendRedirect("homepage.jsp");
		}
		Person  pers=(Person)request.getSession().getAttribute("person");
		int skill_id=Integer.parseInt(request.getParameter("skill_id"));
		String type=request.getParameter("SUBMIT");
		String skill_level=request.getParameter("level");
		DataForPerson data=new DataForPerson();
		if(type.equals("change")){
			data.updateSkill(skill_id,skill_level,Integer.parseInt(pers.getId()));
		}else{
			data.deleteSkill(skill_id,Integer.parseInt(pers.getId()));
		}
		
		response.sendRedirect("skillsUpdate.jsp");
	}

}
