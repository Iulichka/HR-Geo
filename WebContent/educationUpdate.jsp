<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Profile</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/bootstrap-3.2.0.min.css">
	<link rel="stylesheet" type="text/css" href="http://snipplicious.com/css/font-awesome-4.1.0.min.css">
	<script src="http://snipplicious.com/js/jquery.js"></script>
	<script src="http://snipplicious.com/js/bootstrap.min.js"></script>
<title>Update Education Information</title>
</head>
<body>
<%@page import="backClasses.*" %>
<%@page import="java.util.ArrayList"%>
 <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		ArrayList<Education> edu=null;
		Person p=null;
		ArrayList<String> gradTypes=null;
			if(request.getSession(false)!=null && session.getAttribute("email")!=null && session.getAttribute("person")!=null){
				user=(String)session.getAttribute("email");
				first_name=(String)session.getAttribute("first_name");
				last_name=(String)session.getAttribute("last_name");
				p=(Person)session.getAttribute("person");
				DataForPerson data=new DataForPerson();
				edu=data.getPersonEducation(Integer.parseInt(p.getId())).getEduList();
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

<thead><tr><th>Education Place</th><th>Faculty</th><th>Graduation Year</th><th>Graduation Type</th><th>Submit Change</th><th>Delete Education Entry</th></thead>
		<tbody>
				<%for(int i=0;i<edu.size();i++){  %>
					<tr>
					<form action="EducationUpdateServlet" method="post">
						<td><%=edu.get(i).getUniversity()%></td>
						<td><%=edu.get(i).getFaculty() %></td>
						<td>
							<select name="year" id="year" class="form-control">
							
								<%for(int j=1940;j<2030;j++){ %>	
									<%if(edu.get(i).getEndYear()==j){ %>
										 <option selected="selected" value=<%=j %>><%=j %></option>
									<%}else{%>
											 <option value=<%=j %>><%=j%></option>
									<%} %>
								<%} %>
							</select>
						</td>
						<td>
							<select name="grad_type" id="grad_type" class="form-control">
								<%if(edu.get(i).getLevel().equals("საშუალო")){ %>
									 <option selected="selected" value="საშუალო" > საშუალო</option>
								<%}else {%>
									<option value="საშუალო">საშუალო</option>
								<% } %>
								<%if(edu.get(i).getLevel().equals("ბაკალავრი")){ %>
									 <option selected="selected" value="ბაკალავრი" > ბაკალავრი</option>
								<%}else {%>
									<option value="ბაკალავრი">ბაკალავრი</option>
								<% } %>
								<%if(edu.get(i).getLevel().equals("მაგისტრატურა")){ %>
									 <option selected="selected" value="მაგისტრატურა" >მაგისტრატურა</option>
								<%}else {%>
									<option value="მაგისტრატურა">მაგისტრატურა</option>
								<% } %>
								<%if(edu.get(i).getLevel().equals("დოქტორი")){ %>
									 <option selected="selected" value="დოქტორი" >დოქტორი</option>
								<%}else {%>
									<option value="დოქტორი">დოქტორი</option>
								<% } %>								
							</select>
						</td>
						<td>
							<input type="hidden" name="university" value=<%=edu.get(i).getUniversity()%>>
							<input type="hidden" name="faculty" value=<%=edu.get(i).getFaculty()%>>							
							<button type="submit" name="SUBMIT" value="change" style="background-color: transparent;border-color: transparent ;">
							<span class="glyphicon glyphicon-ok"></span>
							</button> 
						</td>
						<td>
							<input type="hidden" name="university" value=<%=edu.get(i).getUniversity()%>>
							<input type="hidden" name="faculty" value=<%=edu.get(i).getFaculty()%>>							
							<button type="submit" name="SUBMIT" value="delete" style="background-color: transparent;border-color: transparent ;">
							<span class="glyphicon glyphicon-remove"></span>
							</button> 
						</td>
						</form>
					</tr>
				<%} %>
		</tbody>

</table>

</body>
</html>