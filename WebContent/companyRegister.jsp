<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Company Registration</title>
<style type="text/css">
	.warning {
		border: 1px solid red;
	}
</style>
<script  type="text/javascript">
var error = false;
$(document).ready(function() {
	$('#registerButton').click(function(e) {
		e.preventDefault();
		validateCompanyName();
		validateCompanyEMail();
		validateCompanyTelephone();
		validateCompanySite();
		validateCompanyPassword();
		validateCompanyRePassword();
		if (!error)
			$("#submitForm").submit();
	});
});

function validateCompanyName() {
	if (document.getElementById("company_name").value.length < 2) {
		document.getElementById("notice").innerHTML = "კომპანიის სახელი არასწორადაა  მითითებული";
		//document.getElementById("registerButton").disabled = true;
		$('#company_name').addClass('warning');
		error = true;
	} else {
		//document.getElementById("registerButton").disabled = false;
		error = false;
	}
}
function validateCompanyEMail() {
	var email = document.getElementById('email');
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(email.value)) {
		document.getElementById("notice").innerHTML = "მეილი  არასწორადაა  მითითებული";
		$('#email').addClass('warning');
		//document.getElementById("registerButton").disabled = true;
		error = true;
	} else {
		//document.getElementById("registerButton").disabled = false;
		error = false;
	}
}
function validateCompanyTelephone() {
	if (document.getElementById("tel").value.length < 6) {
		document.getElementById("notice").innerHTML = "ტელეფონი  არასწორადაა  მითითებული";
		//document.getElementById("registerButton").disabled = true;
		$('#tel').addClass('warning');
		//document.getElementById("registerButton").disabled = true;
		error = true;
	} else {
		document.getElementById("registerButton").disabled = false;
		error = false;
	}
}
function validateCompanySite() {
	var email = document.getElementById('site');
	var filter = /^([a-zA-Z0-9_\.\-])+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(email.value)) {
		document.getElementById("notice").innerHTML = "მეილი  არასწორადაა  მითითებული";
		//document.getElementById("registerButton").disabled = true;
		$('#site').addClass('warning');
		error = true;
		//document.getElementById("registerButton").disabled = true;
	} else {
		document.getElementById("registerButton").disabled = false;
		error = false;
	}
}
function validateCompanyPassword() {
	var pass = document.getElementById("password").value;
	if (pass.length < 6) {
		document.getElementById("notice").innerHTML = "პაროლი უნდა შეიცავდეს მინიმუმ 6 სიმბოლოს!";
		//document.getElementById("registerButton").disabled = true;
		$('#password').addClass('warning');
		error = true;
		//document.getElementById("registerButton").disabled = true;
	} else {
		document.getElementById("registerButton").disabled = false;
		error = false;
	}
}
function validateCompanyRePassword() {
	var pass = document.getElementById("password").value;
	var repass = document.getElementById("password_confirmation").value;
	if (pass != repass) {
		document.getElementById("notice").innerHTML = "არ ემთხვევა პაროლი";
		//document.getElementById("registerButton").disabled = true;
		$('#password_confirmation').addClass('warning');
		error = true;
		//document.getElementById("registerButton").disabled = true;
	} else {
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
      <form class="navbar-form navbar-right" action="LoginServlet" method="post" role="login">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="email" name="email">
          <input type="password" class="form-control" placeholder="password" name="password">
          <label><input type="checkbox" name="check" >Company</label>
        </div>
        <button type="submit" class="btn btn-default" value="Login">Login</button>
      </form>   
         
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<form action="CompanyRegisterServlet" method="post">
	<div class="container">
		<div class="row">
   			 <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<h2>Registration Page <small>company register.</small></h2>
			<hr class="colorgraph">	
			<p id ="notice" class="bg-danger" style="text-align:center; color: #000;"></p>	
					<div class="form-group">
                        <input type="text" name="company_name" id="company_name" class="form-control input-lg" placeholder="Company Name" tabindex="1">
					</div>			
			<div class="form-group">
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address" tabindex="4">
			</div>
			<div class="form-group">
				<input type="text" name="tel" id="tel" class="form-control input-lg" placeholder="Telephone" tabindex="4">
			</div>
			<div class="form-group">
				<input type="text" name="site" id="site" class="form-control input-lg" placeholder="Site" tabindex="4">
			</div>
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
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">I Agree</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					 By clicking <strong class="label label-primary">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="Register" id="registerButton" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
			</div>
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