package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForPerson;
import backClasses.Person;

/**
 * Servlet implementation class SkillAddServlet
 */
@WebServlet("/SkillAddServlet")
public class SkillAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SkillAddServlet() {
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
			return;
		}
		DataForPerson data=new DataForPerson();
		String skillName=request.getParameter("skill_name");
		String level=request.getParameter("level");
		int skillLevelId=data.getSkillLevelId(level);
		int skillId=data.getSkillId(skillName);
		Person  pers=(Person)request.getSession().getAttribute("person");
		int persId=Integer.parseInt(pers.getId());
		data.addSkill(skillId,skillLevelId,persId);
		response.sendRedirect("skillsUpdate.jsp");
	}

}
