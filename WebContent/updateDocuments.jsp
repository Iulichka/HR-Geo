<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload Documents</title>
</head>
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
<body>
<%@page import="backClasses.*" %>
 <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		Person p=null;
		DataForPerson data = new DataForPerson();
			if(request.getSession(false)!=null && session.getAttribute("email")!=null && session.getAttribute("person")!=null){
				user=(String)session.getAttribute("email");
				first_name=(String)session.getAttribute("first_name");
				last_name=(String)session.getAttribute("last_name");
				p=(Person)session.getAttribute("person");
				
			}else{
   			 	response.sendRedirect("http://localhost:8080/HR-Geo/homePage.jsp");
   			 	return;
			}			
%> 
<nav class="navbar navbar-default">
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
<table class="table table-hover">
	<thead><tr><th>My Cv</th></thead>
	<thead><tr><th>Description</th><th>CV</th><th>Delete CV</th></tr></thead>
		<tbody>
			<tr>
			<form action="RemoveCvServlet" method="post">
				<td>CV</td>
				<td>
					<a href="GetDocument?id=<%=p.getId()%>">CV download</a>
				</td>
				<td>
					<input type="hidden" name="person_id" value="<%=p.getId() %>">
						 <a href="#<%=p.getId()%>" data-toggle="modal"><button type="button" name="b" value="k" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-remove"></span>
						</button> </a>
						<div class="modal fade" id="<%=p.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			</form>	
			</tr>
		</tbody>
</table>

		<div class="row">
		  <div class="col-lg-6">
		    <div class="input-group">
		    <form action=<%="\""+"Upload?id="+p.getId()+"&type=cv\"" %> method="post" enctype="multipart/form-data">
		      <span class="input-group-btn" style="width: 200px">
		        <input type="text" class="form-control" name="description" placeholder="Enter Description">
		      </span>
		      <input type="file" class="form-control" placeholder="upload " name="file" style="width:300px;">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit">Upload!</button>
		      </span>
		      </form>
		    </div><!-- /input-group -->
		  </div>
		</div>
		
		<br></br>
		<br></br>
		<br></br>
		
<table class="table table-hover">
	<thead><tr><th>My Documents</th></thead>
	<thead><tr><th>Description</th><th>Document</th><th>Delete Document</th></tr></thead>
		<tbody>
			<%
			ArrayList<String> docs = data.getDocs(p.getId());
			for (int i=0; i<docs.size(); i++) {%>
			<tr>
			<form action="DeleteDoc" method="post">
				<td><%=docs.get(i)%></td>
				<td>
					<a href="GetDocument?id=<%=p.getId()%>&name=<%=docs.get(i)%>">Document</a>
				</td>
				<td>
					<input type="hidden" name="person_id" value="<%=p.getId() %>">
					<input type="hidden" name="doc_name" value="<%=docs.get(i) %>">
						 <a href="#<%=i%>" data-toggle="modal"><button type="button" name="b" value="k" style="background-color: transparent;border-color: transparent ;">
						<span class="glyphicon glyphicon-remove"></span>
						</button> </a>
						<div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			</form>	
			</tr>
			<% } %>
			
		</tbody>
</table>
		<div class="row">
		  <div class="col-lg-6">
		    <div class="input-group">
		    <form action=<%="\""+"Upload?id="+p.getId()+"&type=document\"" %> method="post" enctype="multipart/form-data">
		      <span class="input-group-btn" style="width: 200px">
		        <input type="text" class="form-control" name="description" placeholder="Enter Description" required="required">
		      </span>
		      <input type="file" class="form-control" placeholder="upload " name="file" style="width:300px;">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit">Upload!</button>
		      </span>
		      </form>
		    </div><!-- /input-group -->
		  </div>
		</div>
		
</body>
</html>