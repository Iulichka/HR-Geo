<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Profile</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
  </head>
  <body>
  <%
		//allow access only if session exists
		String user =null;
		String first_name = null;
		String last_name = null;
		if(session.getAttribute("first_name")==null){
			if(session.getAttribute("email")!=null){
				user=(String)session.getAttribute("email");
			}else{
   			 	response.sendRedirect("homePage.jsp");
			}
		}else{
			user = (String)session.getAttribute("first_name")+" "+(String)session.getAttribute("last_name");
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
      <a class="navbar-brand" href="personProfile.jsp"><%=user%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registration <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="companyRegister.jsp">Register Company</a></li>
            <li><a href="personRegister.jsp">Register Person</a></li>
          </ul>
        </li>       
      </ul>     	         
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div class="container">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<h4>Update Your Profile  <%=user %></h4>
			<hr class="colorgraph">		
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2">
					</div>
				</div>
				</div>
				<div class="form-group">
    			<label for="multi">Update Skills</label>
    			<input type="text" name="skills" placeholder="add skills" class="form-control" id="multi" />
  			</div>									
			<div class="form-group">
				<input type="text" name="id_number" id="id_number" class="form-control input-lg" placeholder="ID Number" tabindex="3">
			</div>
			
			<div class="form-group">
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
			</div>
			
			 <div class="form-group">
       				 <label for="birthday" class="col-xs-3 col-sm-2 control-label">Birthday</label>
        				<div class="col-xs-3">
         				   <input type="text" name="year" class="form-control" placeholder="year"/>
        				</div>
       				 <div class="col-xs-3">
         				   <input type="text" name="month"  class="form-control" placeholder="month"/>
       				 </div>
       					 <div class="col-xs-3">
         				   <input type="text" name="day" class="form-control" placeholder="day"/>
       					 </div>    
   					 </div>	
   					 
			<label class="radio-inline">
 			 	<input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="MALE" checked>MALE
			</label>
			
			<label class="radio-inline">
  				<input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="FEMALE">FEMALE
			</label>
				
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5">
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6">
					</div>
				</div>
			</div>
    </div>
</div>
			<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">									
						<input type="submit" value="Update" class="btn btn-primary btn-block btn-lg" tabindex="7">
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