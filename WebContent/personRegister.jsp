<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Person Registration</title>
<style type="text/css">
	.warning {
		border: 1px solid red;
	}
</style>

<script  type="text/javascript">
var error = false;
$(document).ready(function() {
	$('#password_confirmation').onkeydown(function(e) {
				
		validateRePassword();
		if (!error){
			$("#submitForm").submit();
		}
	});
});

function validateRePassword() {
	var pass = document.getElementById("password").value;
	var repass = document.getElementById("password_confirmation").value;
	if (pass != repass) {
	
		error=true;
		document.getElementById("notice").innerHTML = "არ ემთხვევა პაროლი";
		//document.getElementById("registerButton").disabled = true;
		$('#password_confirmation').addClass('warning');
		
	} else {
		$('#password_confirmation').removeClass('warning');
		document.getElementById("registerButton").disabled = false;
		error = false;
	}
}

</script>

</head>
<body>
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



<form action="VerifyByMailServlet" id="submitForm" method="post" accept-charset="UTF-8">
<div class="container">
	<div class="row">
    	<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<h2>Registration Page <small>person registration.</small></h2>
			<hr class="colorgraph">	
			<p id ="notice" class="bg-danger" style="text-align:center; color: #000;"></p>	
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="first_name" id="first_name" class="form-control input-lg" placeholder="First Name" tabindex="1" required="required">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="last_name" id="last_name" class="form-control input-lg" placeholder="Last Name" tabindex="2" required="required">
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<input type="text" name="id_number" id="id_number" class="form-control input-lg" placeholder="ID Number" tabindex="3" required="required">
			</div>
			
			<div class="form-group">
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4" required="required">
			</div>
			
			  <div class="form-group">
          <label class="col-lg-3 control-label">Birth Date:</label>
          <div class="col-lg-8">
            <input class="form-control" placeholder="date" name="date" type="date" required="required">
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
						<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="5" required="required">
					</div>
				</div>
				
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password"  name="password_confirmation" id="password_confirmation" class="form-control input-lg" placeholder="Confirm Password" tabindex="6" required="required">
					</div>
				</div>
			</div>
    </div>
</div>
	
	
	<div class="row" style="margin-left: 22%;text-align: center;">
		<div class="col-xs-8 col-sm-9 col-md-9">
			 By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
		</div>
	</div>
			<hr class="colorgraph">
				<div class="row" >
					<div class="col-xs-12 col-md-6" style="margin-left: 25%">									
						<input type="submit" value="Register" id="registerButton" class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
				</div>	
				
</form>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
			</div>
			<div class="modal-body">
				<p>ყველაფერს ვეთანხმები ბრატ</p>
				<p>ყველაფერს ვეთანხმები ბრატ</p>
				<p>ყველაფერს ვეთანხმები ბრატ</p>
				<p>ყველაფერს ვეთანხმები ბრატ</p>
				<p>ყველაფერს ვეთანხმები ბრატ</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>


</body>
</html>