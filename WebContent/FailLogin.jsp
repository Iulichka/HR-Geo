<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 <script src="js/prefixfree.min.js"></script>
</head>
<body>
 <div class="body"></div>
		<div class="grad"></div>
			<div class="header">			
				<div>HR<span>geo</span></div>
			</div>
			<br>
			<div class=login>
		<form action="LoginServlet" method="post">
				<input type="text" placeHolder="email"  name="email"><br>
				<input type="password" placeHolder="password" name="password"><br>
				<input type="submit"  class="btn btn-primary btn-sm" value="Login">
				<div class="form-group">
   					 <div class="col-sm-offset-2 col-sm-10">
    					  <div class="checkbox">
      						  <label>
        						  <input type="checkbox" name="check">Company
       						 </label>
      					  </div>
   					 </div>
 			    </div>
		</form>
		</div>		
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

</body>
</html>