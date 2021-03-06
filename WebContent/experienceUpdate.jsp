<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html> 
<html lang="ka">
<head>
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
<title>Update Experience</title>
</head>
<body>
<%@page import="backClasses.*" %>
<%@page import="java.util.ArrayList"%>
 <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		Person p=null;
		Experience cur=null;
		Iterator<Experience> exp=null;
			if(request.getSession(false)!=null && session.getAttribute("email")!=null && session.getAttribute("person")!=null){
				user=(String)session.getAttribute("email");
				first_name=(String)session.getAttribute("first_name");
				last_name=(String)session.getAttribute("last_name");
				DataForPerson data=new DataForPerson();
				p=(Person)session.getAttribute("person");
				exp=data.getPersonExperience(Integer.parseInt(p.getId())).getIterator();
			}else{
   			 	response.sendRedirect("homePage.jsp");
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
 <table class="table table-condensed">
<thead><tr><th>Company</th><th>Position</th><th>Start Date</th><th>End Date</th><th>Edit</th><th>Delete</th></thead>
			<%while(exp.hasNext()) {%>
				<form action="ExperienceUpdateServlet" method="post">
				<%cur=exp.next(); %>
				<tr>
					<td><%=cur.getCompName()%></td>
					<td><%=cur.getPosition() %></td>
					<td>
					   <input class="form-control" placeholder="date" name="start_date" type="date" value=<%=cur.getStartDate()%> required="required">
					</td>
					<td>
						<%if(cur.getEndDate()!=null){ %>
					   <input class="form-control" placeholder="date" name="end_date" type="date" value=<%=cur.getEndDate()%>>
						<%}else {%>
					   <input class="form-control" placeholder="date" name="end_date" type="date" >					
						<%} %>
					</td>
					
					<td> 
						<input type="hidden" name="exp_id" value=<%=cur.getId() %>>		
						<input type="hidden" name="company_name" value=<%=cur.getCompName() %>>
						<input type="hidden" name="pos_name" value=<%=cur.getPosition() %>>				
						<button type="submit" name="SUBMIT" value="change" style="background-color: transparent;border-color: transparent ;">
						  <a href="#<%=cur.getId()%>" data-toggle="modal"><button type="button" name="b" value="k" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-ok"></span>
						</button> </a>
						<div class="modal fade" id="<%=cur.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						<input type="hidden" name="exp_id" value=<%=cur.getId() %>>	
						<input type="hidden" name="company_name" value=<%=cur.getCompName() %>>
						<input type="hidden" name="pos_name" value=<%=cur.getPosition() %>>							
						<a href="#deleteModal<%=cur.getId()%>" data-toggle="modal" >
			           <button type="button"  name="b2" value="bc" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-remove"></span>
						</button> </a>
						<div class="modal fade" id="deleteModal<%=cur.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
					
				</tr>
			</form>	
        	<% }%>
        	
        	<tr>
        	<td> Enter Experience Properties and Click "+" to add</td>
        	</tr>
        	<form action="ExperienceAddServlet" method="post">
        	<tr>
        		<td>
        			<input type="text" required="required" class="form_control" name="company_name" placeholder="Company name">
        		</td>
        		<td>
        			<input type="text" required="required" class="form_control" name="postition_name" placeholder="Position Name">
        		</td>
				
				<td>						   
					<input class="form-control" placeholder="Start Date" name="start_date" type="date"  required="required">	
				</td>        		
				<td> 
					<input class="form-control" placeholder="End Date" name="end_date" type="date" >					
				</td>
				<td>
					<button type="submit"  name="SUBMIT" value="add" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-plus"></span>
					</button> 
				</td>
        	</tr>
        	</form>
        		
</table>


</body>
</html>