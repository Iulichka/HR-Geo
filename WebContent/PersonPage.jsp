<%@page import="java.util.HashMap"%>
<%@page import="backClasses.Skill"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="backClasses.Experience"%>
<%@page import="backClasses.PersonEducation"%>
<%@page import="backClasses.PersonSkills"%>
<%@page import="backClasses.OverallExperience"%>
<%@page import="backClasses.Education"%>
<%@page import="backClasses.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
Person per =(Person) request.getAttribute("person");
if(per==null){
	response.sendRedirect("homePage.jsp");
	return;
}
PersonEducation edu = (PersonEducation) request.getAttribute("education");
OverallExperience exp = (OverallExperience) request.getAttribute("experience");
PersonSkills skills = (PersonSkills) request.getAttribute("skills");
ArrayList<String> docs =(ArrayList<String>) request.getAttribute("docs");
//session.setAttribute("file", per.getPhoto());
%>
<title><%=per.getName()+" "+per.getSurname() %></title>
</head>
<body>

<%@include  file="bootstrap.html" %>
<%//session.setAttribute("file", per.getPhoto()); %>
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
      <a class="navbar-brand" href="Companies.jsp">Companies</a>
       <a class="navbar-brand" href="Stats.jsp">Statistic</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <%if(session.getAttribute("email")==null){ %>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registration <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="companyRegister.jsp">Register Company</a></li>
            <li><a href="personRegister.jsp">Register Person</a></li>
          </ul>
        </li>
      </ul>
    
      <form class="navbar-form navbar-right" action="LoginServlet" method="post" role="login">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="email" name="email">
          <input type="password" class="form-control" placeholder="password" name="password">
          <label><input type="checkbox" name="check" >Company</label>
        </div>
        <button type="submit" class="btn btn-default" value="Login">Login</button>
      </form>   
       <% } else if(session.getAttribute("person")!=null){%>
       		 <a class="navbar-brand" href="PersonServlet">My Profile</a>
       		 <form class="navbar-form navbar-right" action="LogoutServlet" method="post" role="logout">
          		<button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          	</form>
       <% } else{ %>
       		 <a class="navbar-brand" href="CompanyServlet">My Profile</a>
       		 <form class="navbar-form navbar-right" action="LogoutServlet" method="post" role="logout">
          		<button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          	</form>
       <%} %>
         
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="page-header">
  <h1 style="color: blue;"><%=per.getName()+" "+per.getSurname() %> 
  <% if(exp!=null&&exp.getCurrentExperience()!=null){%>
  <small><%=exp.getCurrentExperience().getPosition()+" at " + exp.getCurrentExperience().getCompName()%></small>
  <% }%>
  </h1>
</div>



<div id="pic">
  <div class="col-xs-4 col-md-2">
    <a href="#" class="thumbnail">
      <img src="GetPersonPicture?id=<%=per.getId() %>" alt="profile picture">
    </a>
  </div>
</div>


<div id="about" style="position: absolute; padding-left: 60%;">
<div >
<h3>About</h3>
  <p>
    <%=per.getAbout()%>
  </p>
</div>
</div>
<%if(docs!=null){ %>
<div id="cv" style="position: absolute; padding-left: 60%; padding-top: 20%" >
<h3>CV</h3>
<a href="GetDocument?id=<%= per.getId()%>">CV download</a>
</div>

<div id="docs" style="position: absolute; padding-left: 60%; margin-top: 30%">
<h3 >Documents</h3>
<%for(int i=0; i<docs.size(); i++) { 
	String document = docs.get(i);
%>
<p>
  <a href=<%="\""+"GetDocument?id="+per.getId()+"&name="+document+"\""%>>
    <%=document %>
  </a>
  </p>
  <%} %>
</div>
<%} %>

<%if(exp!=null){ %>
<div id="experience" style="width: 50%;">
 <div class="panel panel-default">
 <h3><%=per.getAge() %> years old</h3>
      <div class="panel-heading">
        <h4 class="panel-title">
          Overall Experience <%= exp.getSumOfFullYears() %> years 
        </h4>
      </div>
 <p> </p>
<p id="date"> Birth Date: 
<%= per.getDate()%>
</p>
<p id="mail">
<%
out.println("e-mail: "+ per.getMail());
%>
</p>


        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Position</th><th>Company</th><th>duration</th><th>End Date</th><th>status</th></tr></thead>														
					<tbody>
						<%
							Iterator<Experience> it  = exp.getIterator();
							while(it.hasNext()) {
								Experience ex = it.next(); 
							%>
           				<tr>
                    		<td><%= ex.getPosition() %></td> 
                    		<td><%= ex.getCompName() %></td> 
                    		<td><%= ex.getMonthDuration() %> month</td> 
                    		<td><%= ex.getEndDate() %></td> 
                    		<td><% if(ex.isCurrent()) out.print("Working"); else out.print("retired"); %></td>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
    </div>

</div>
<%} %>
<% if(edu!=null){ %>
<div id="Education" style="width: 50%;">
 <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          Education
        </h4>
      </div>
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>University</th><th>Faculty</th><th>Degree</th><th>End year</th><th>Status</th></tr></thead>														
					<tbody>
						<%
							ArrayList<Education> edArr = edu.getEduList();
							for(int i=0; i<edArr.size(); i++){
								Education ed = edArr.get(i);
							%>
           				<tr>
                    		<td><%= ed.getUniversity() %></td> 
                  	 		<td><%= ed.getFaculty() %></td> 
                    		<td><%= ed.getLevel() %></td> 
                    		<td><%= ed.getEndYear() %></td> 
                    		<td><% if(ed.getEndYear()>new Date().getYear()+1900) out.print("current"); else out.print("graduated");%></td>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
    </div>

</div>

<%} %>
<% if(skills!=null){ %>
<div id="Skills"  style="width: 50%">
  <div class="panel-group" id="accordion">
 	<%
 	HashMap<String, ArrayList<Skill> > categoryMap = skills.getCategoryMap();
 	Iterator<String> iter = categoryMap.keySet().iterator();
 	int i = 0;
 	while(iter.hasNext()) {
 	 //   Offer key = entry.getKey();
 	 //accordion
 	   // ArrayList<Person> value = entry.getValue();
 	 	String curCategory = iter.next();
 	    String collapseHREF="#collapse"+i;
 	    String collapseID="collapse"+i;
 	    ArrayList<Skill> categorySkills = categoryMap.get(curCategory);
 	    
	%>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title" >
          <a data-toggle="collapse" data-parent="#accordion" href=<%=collapseHREF %>><%= curCategory  %> Skills </a>
        </h4>
      </div>
      <div id=<%=collapseID %> class="panel-collapse collapse out">
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Skill</th><th>Level</th></tr></thead>														
					<tbody>
						<%
						if(categorySkills!=null)
							for(int j=0; j<categorySkills.size(); j++){
								
								Skill currentSkill = categorySkills.get(j);	
								int length = currentSkill.getLevel().length();
								String cssClass;
								if(length < 7) {
									cssClass = "danger";
								} else if (length<10) {
									cssClass = "warning";
								} else {
									cssClass = "success";
								}
							%>
           				<tr class=<%="\""+cssClass+"\"" %> >
                    		<td><%= currentSkill.getName()%></td> 
                    		<td><%= currentSkill.getLevel() %></td> 
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
      </div>
    </div>
 
 	<%
 	i++;
 	} %>
    </div>
  </div>
  <%} %>
 <div class="copyRight" id="copyRight" style="font-size: 12pt;
	text-align: center;
	bottom: inherit;
	padding-top: 100pt;" >
                <div class="col-lg-12">
                    <p>Copyright &copy; HR-geo 2015</p>
                </div>
            </div>
</body>
</html>