<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/bootstrap-3.2.0.min.css">
	<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/font-awesome-4.1.0.min.css">
	<script src="http://snipplicious.com/js/jquery.js"></script>
	<script src="http://snipplicious.com/js/bootstrap.min.js"></script>
<title>Update Skills</title>
</head>
<body>
<%@page import="backClasses.*" %>
 <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		Person p=null;
		ArrayList<Skill> skillArray=null;
		ArrayList<String> skillLevels=null;
		ArrayList<String> skillNames=null;
			if(request.getSession(false)!=null && session.getAttribute("email")!=null && session.getAttribute("person")!=null){
				user=(String)session.getAttribute("email");
				first_name=(String)session.getAttribute("first_name");
				last_name=(String)session.getAttribute("last_name");
				p=(Person)session.getAttribute("person");
				DataForPerson data=new DataForPerson();
				PersonSkills skills=data.getPersonSkills(data.getPersonId(user));
				skillArray=skills.getPersonSkills();
				skillLevels=data.getSkillLevels();
				skillNames=data.getSkillNames();
			}else{
   			 	response.sendRedirect("http://localhost:8080/HR-Geo/homePage.jsp");
   			 	return;
			}			
%>  
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="homePage.jsp">Home</a>
      <a class="navbar-brand" href="http://localhost:8080/HR-Geo/PersonServlet"><%=p.getName()+" "+p.getSurname()%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      <form class="navbar-form navbar-right" action="LogoutServlet" method="post" role="logout">
          <button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          </form>
             	         
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
 <table class="table table-condensed">
<thead><tr><th>Skill Name</th><th>Skill Level</th><th>Submit Change</th><th>Delete Skill</th></thead>
<tbody>
	
		<%for(int i=0;i<skillArray.size();i++){ %>
				<tr>
		<form action="SkillChangeServlet" method="post">
				<td><%=skillArray.get(i).getName() %></td>
				<td>
					<select name="level" id="level" class="form-control">
					<%for(int j=0;j<skillLevels.size();j++){ %>
						<%if(skillArray.get(i).getLevel().equals(skillLevels.get(j))){ %>
							 <option selected="selected" value="<%=skillLevels.get(j) %>"><%=skillLevels.get(j) %></option>
						<%}else{%>
							 <option value="<%=skillLevels.get(j) %>"><%=skillLevels.get(j) %></option>
						<%} %>
					<%} %>
					
					</select>		
				</td>
				<td>
						<input type="hidden" name="skill_id" value="<%=skillArray.get(i).getId()%>"> 
						<a href="#<%=skillArray.get(i).getId()%>" data-toggle="modal"><button type="button" name="b" value="k" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-ok"></span>
						</button> </a>
						<div class="modal fade" id="<%=skillArray.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel"> Seriously? </h4>
									</div>
									<div class="modal-body">
										<h2 style="padding-left: 38%;" >Are You Sure ?</h2>
									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
										<button type="submit" name="SUBMIT" value="change" class="btn btn-primary" >Yes</button>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
						
						
						
				
				 </td>
				 <td>
						<input type="hidden" name="skill_id" value="<%=skillArray.get(i).getId()%>" >
			<a href="#deleteModal<%=skillArray.get(i).getId()%>" data-toggle="modal" >
			           <button type="button"  name="b2" value="bc" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-remove"></span>
						</button> </a>
						<div class="modal fade" id="deleteModal<%=skillArray.get(i).getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel"> Seriously? </h4>
									</div>
									<div class="modal-body">
										<h2 style="padding-left: 38%;" >Are You Sure ?</h2>
									
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
										<button type="submit" name="SUBMIT" value="delete" class="btn btn-primary" >Yes</button>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal-dialog -->
						</div>
						
						
				 </td>	
				 </form>
			</tr>
		<% } %>  
		<tr>  
			<td><label>Choose Skill and Click Plus To add</label> </td>
		</tr>
		<tr>
		<form action="SkillAddServlet" method="post">
			 <td>
			 	<select class="form-control" name="skill_name" id="skill_name">
			 		<option selected="selected" disabled="disabled">Skill </option>
			 		<%for(int i=0;i<skillNames.size();i++){ %>
			 			<option value="<%=skillNames.get(i)%>"><%=skillNames.get(i) %> </option>
			 		<%} %>
			 	</select>
			 </td>
			 <td>
				<select name="level" id="level" class="form-control">
				<option selected="selected" disabled="disabled">Level </option>
				<%for(int j=0;j<skillLevels.size();j++){ %>
					<option value="<%=skillLevels.get(j) %>"> <%=skillLevels.get(j) %></option>
				<%} %>
				
				</select>	 		
			 </td>
			 
			 <td>
			 	<button type="submit"  name="SUBMIT" value="add" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-plus"></span>

				</button> 
			 </td>
		</form>
		</tr>
		 
 </tbody>
</table>
	

</body>
</html>