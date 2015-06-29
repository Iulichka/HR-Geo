package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import backClasses.DataForStat;

/**
 * Servlet implementation class ChartData
 */
@WebServlet("/ChartData")
public class ChartData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		DataForStat stat = new DataForStat();
		if (("gender").equals(type)) {
			out.print(stat.getGenderNums());
		} else if("skills".equals(type)) {
			out.print(stat.getSkillsStat());
		} else if ("skillsDemand".equals(type)) {
			//System.out.println(stat.getSkillsDemand());
			out.print(stat.getSkillsDemand());
		}else if("uniStat".equals(type)) {
			//System.out.println(stat.getSkillsDemand());
			out.print(stat.getUniStat());
		} else if("faculty".equals(type)){
			System.out.println(stat.getFacultyStat());
			out.print(stat.getFacultyStat());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
