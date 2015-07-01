<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>   
<meta charset=UTF-8>
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
<title>Company Profile Update</title>

</head>
<body>
<%@page import="backClasses.*" %>
 <%
		//allow access only if session exists
		String companyEmail =null;	
 		Company company=null;
			if(request.getSession()!=null && session.getAttribute("email")!=null && request.getAttribute("person")==null){
				companyEmail=(String)session.getAttribute("email");
				company=(Company)session.getAttribute("company");
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



<form action="CompanyUpdateServlet" method="post">
<div class="container" style="padding-top: 60px;">
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="CompImage?mail=<%=companyEmail%>&type=image/jpeg&num=1" alt="" class="img-circle img-responsive" class="avatar img-circle img-thumbnail" alt="avatar">
     
      </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a> 
        <i class="fa fa-coffee"></i>
        This is an <strong>.alert</strong>. Please fill with relevant information
      </div>
      <h3>Personal info</h3>
        <div class="form-group">
          <label class="col-lg-3 control-label">Company Name:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%=company.getName() %> name="name" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Company Tel:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%=company.getTel() %> name="tel" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Company Site:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%=company.getSite() %> name="site" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" value=<%=company.getMail() %> name="email" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Current Password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="Enter Current Password" name="current_password" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="Enter Password" name="password" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder = "password_confirm" name="password_confirm" type="password">
          </div>
        </div>
           <div class="form-group">
          <label class="col-lg-3 control-label">About me</label>
          <div class="col-lg-8">
           	<textarea cols="50" rows="5" name="about"> 
				<%=company.getInfo() %>
			</textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" name="Save changes" value="Save Changes" type="submit">
            <span></span>
            <input class="btn btn-default" value="Cancel" type="reset">
          </div>
        </div>
    </div>
  </div>
</div>
</form>
  <div>
  <form action=<%="\""+"Upload?mail="+company.getMail()+"\"" %> method="post" enctype="multipart/form-data">
    		<input type="text" name="description" />
    		<input type="file" name="file" />
    		<input type="submit" />
			</form>    

</div>
</body>
</html>