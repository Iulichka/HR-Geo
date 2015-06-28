<!doctype html>
<html>
<head>
 <meta charset="utf-8">
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
<title>Company Profile Update</title>

</head>
<body>
<%@page import="backClasses.*" %>
 <%
		//allow access only if session exists
		String companyEmail =null;	
 		Company company=null;
			if(session.getAttribute("email")!=null){
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
      <a class="navbar-brand" href="http://localhost:8080/HR-Geo/CompanyServlet"><%=companyEmail%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      <form class="navbar-form navbar-right" action="LogoutServlet" method="post">
          <button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          </form>   	         
    </div>
  </div>
</nav>



<form action="CompanyUpdateServlet" method="post">
<div class="container" style="padding-top: 60px;">
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="" class="img-circle img-responsive" class="avatar img-circle img-thumbnail" alt="avatar">
     
      </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a> 
        <i class="fa fa-coffee"></i>
        This is an <strong>.alert</strong>. Use this to show important messages to the user.
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