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
</head>
<body>
<%@page import="backClasses.*" %>
 <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		Person p=null;
			if(session.getAttribute("email")!=null){
				user=(String)session.getAttribute("email");
				first_name=(String)session.getAttribute("first_name");
				last_name=(String)session.getAttribute("last_name");
				p=(Person)session.getAttribute("person");
			}else{
   			 	response.sendRedirect("homePage.jsp");
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
<div class="container" style="padding-top: 60px;">
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="" class="img-circle img-responsive"" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo</h6>
       <div>
			<form action=<%="\""+"Upload?id="+p.getId()+"\"" %> method="post" enctype="multipart/form-data">
    			<input type="text" name="description" />
    			<input type="file" name="file" />
			    <input type="submit" />
			</form>
		</div>
       
       
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
      <form class="form-horizontal" role="form">
        <div class="form-group">
          <label class="col-lg-3 control-label">First name:</label>
          <div class="col-lg-8">
            <input class="form-control" name="first_name" placeholder="First Name" type="text" id="first_name" value=<%=p.getName() %>>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Last name:</label>
          <div class="col-lg-8">
            <input class="form-control" name="last_name" placeholder="Last Name" type="text" value=<%=p.getSurname() %>>
          </div>
        </div>
        <!--  
        <div class="form-group">
    			<label  class="col-lg-3 control-label" for="multi">Update Skills</label>
    			<input type="text" name="skills" placeholder="add skills" class="form-control" id="multi" />
  		</div>	
  		 -->
  		 <div class="form-group">
          <label class="col-lg-3 control-label">Birth Date:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="date" name="date" type="date" value=<%=p.getDate().toString() %>>
          </div>
        </div>
    	<div class="form-group">
          <label class="col-lg-3 control-label">Choose Sex</label>
          <div class="col-lg-8">
          <%if(p.getSex().equals("MALE")) {%>
        	<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="MALE" checked="checked"> Male
			</label>
			<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="FEMALE"> Female
			</label>	
			<% }else{ %>
			<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="MALE"> Male
			</label>
			<label class="radio-inline">
				  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="FEMALE" checked="checked"> Female
			</label>
			<% }%>
          </div>
        </div>    
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="email" name="email" type="text" value=<%=p.getMail()%> >
          </div>
        </div>
          <div class="form-group">
          <label class="col-md-3 control-label">Current Password:</label>
          <div class="col-md-8">
            <input class="form-control" placeholder="Enter Current Password" name="current_password" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Password:</label>
          <div class="col-md-8">
            <input class="form-control" placeholder="Enter Password" name="password" type="password">
          </div>
        </div>
        <div class="form-group">
          <label class="col-md-3 control-label">Confirm password:</label>
          <div class="col-md-8">
            <input class="form-control" placeholder = "password_confirm" name="password_confirm" type="password">
          </div>
        </div>
           <div class="form-group">
          <label class="col-lg-3 control-label">About me</label>
          <div class="col-lg-8">
           	<textarea cols="50" rows="5" name="about"> 
				<%=p.getAbout() %>
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
      </form>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
     var nama = ["Java","PHP","Oracle","MySql","Javascript","Ajax","Translator","Taxi Driver","Dancer"];
	$( "#single" ).autocomplete({
		source: nama
	});
	
	 function split( val ) {
		return val.split( /,\s*/ );
	}
	function extractLast( term ) {
		return split( term ).pop();
	}
	$( "#multi" )
		.bind( "keydown", function( event ) {
	if ( event.keyCode === $.ui.keyCode.TAB &&
		$( this ).autocomplete( "instance" ).menu.active ) {
			event.preventDefault();
		}
	})
	.autocomplete({
		minLength: 0,
		source: function( request, response ) {
			response( $.ui.autocomplete.filter(
			nama, extractLast( request.term ) ) );
		},
		focus: function() {
			return false;
		},
		select: function( event, ui ) {
			var terms = split( this.value );
			terms.pop();
			terms.push( ui.item.value );
			terms.push( "" );
			this.value = terms.join( ", " );
			return false;
		}
	});
    </script>
</body>
</html>