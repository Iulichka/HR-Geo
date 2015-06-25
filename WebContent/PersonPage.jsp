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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
Person per =(Person) request.getAttribute("person");
PersonEducation edu = (PersonEducation) request.getAttribute("education");
OverallExperience exp = (OverallExperience) request.getAttribute("experience");
PersonSkills skills = (PersonSkills) request.getAttribute("skills");
%>
<title><%=per.getName()+" "+per.getSurname() %></title>
</head>
<body>
<%@include  file="bootstrap.html" %>
<div id="info">
<%=
per.getAbout()
%>
</div>
<div id="mail">
<%=
per.getMail()
%>
</div>
<div class="page-header">
  <h1 style="color: blue;"><%=per.getName()+" "+per.getSurname() %> <small><%=exp.getCurrentExperience().getPosition()+" at " + exp.getCurrentExperience().getCompName()
  %></small></h1>
</div>


<div id="pic" class="row">
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="http://www.cocult.com/assets/images/profile-default-male.jpg" alt="profile picture">
    </a>
  </div>
</div>

<div id="experience" style="width: 50%;">
 <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          Experience <%= exp.getSumOfFullYears() %> years 
        </h4>
      </div>
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Position</th><th>Company</th><th>duration</th><th>End Date</th><th>status</th></tr></thead>														
					<tbody>
						<%
							Iterator<Experience> it  = exp.getIterator();
							while(it.hasNext()) {
								Experience ex = it.next(); 
							%>
           				<tr class="danger">
                    		<td><%= ex.getPosition() %></td> 
                    		<td><%= ex.getCompName() %></td> 
                    		<td><%= ex.getMonthDuration() %></td> 
                    		<td><%= ex.getEndDate() %></td> 
                    		<td><% if(ex.isCurrent()) out.print("Working"); else out.print("retired"); %></td>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
    </div>

</div>

<div id="Education" style="width: 50%;">
 <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          Education
        </h4>
      </div>
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>University</th><th>Faculty</th><th>Degree</th><th>End year</th><th>is Current</th></tr></thead>														
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
                    		<td><% if(ed.getEndYear()>new Date().getYear()) out.print("current"); else out.print("graduated");%></td>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
    </div>

</div>

<div id="Skills" style="width: 50%;">
 <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          Education
        </h4>
      </div>
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Offer Name</th><th>Person Name</th><th>Offer Sent</th><th>Offer End Date</th><th>Offer Status</th></tr></thead>														
					<tbody>
						<%
							for(int i=0;i<4;i++){					
							%>
           				<tr>
                    		<td>1</td> 
                    		<td>2</td> 
                    		<td>3</td> 
                    		<td>4</td> 
                    		<td>success</td>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
    </div>

</div>
</body>
</html>