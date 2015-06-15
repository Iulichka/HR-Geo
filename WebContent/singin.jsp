<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
  <head>
    <title>Sing In</title>
       
<link rel="stylesheet" type="text/css" href="css/style.css">
    
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
				<input type="submit" name="login" value="Login">
				<label><input type="checkbox" name="check">Company</label>
		</form>
		</div>
		<div id="copyRight">
			All Rights Reserved © HR-Geo Inc.
		</div>
		
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>  
  </body>
</html>

