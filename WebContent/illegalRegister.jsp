<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
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
	<title>Code is Incorrect</title>
</head>
<body>
	 <div  class="centerStyle" style="position: absolute; top: 100px; left:400px; width:600px; margin:auto;" align="center">
			<p style="color:red; font-size: 18px;">კოდი არასწორად არის მითითებული </p>
			<p style="color:white; font-size: 18px;">გთხოვთ, გადაამოწმოთ  თქვენს მიერ მითითებულ ელექტრონულ ფოსტაზე მიღებული  დამადასტურებელი კოდი.<br>
			</p>
				<form method="post" action="VerifyByMailServlet">
					<input class="field" type="text" size="30" name="code">
					<input class="submitButton" type="submit" value="დადასტურება"/>
				</form>
		</div>
</body>
</html>