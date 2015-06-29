<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/modern-business.css" rel="stylesheet">
     <link href="css/persons.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="homePage.css" rel="stylesheet" type="text/css"> 

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<%@ page import="backClasses.*" %>
<title>Home Page</title>
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
    <%if(session.getAttribute("first_name")==null){ %>
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registration <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="companyRegister.jsp">Register Company</a></li>
            <li><a href="personRegister.jsp">Register Person</a></li>
          </ul>
        </li>
      </ul>
      <% } %>
	  <%if(session.getAttribute("person")==null) {%>    
      <form class="navbar-form navbar-right" action="LoginServlet" method="post" role="login">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="email" name="email">
          <input type="password" class="form-control" placeholder="password" name="password">
          <label><input type="checkbox" name="check" >Company</label>
        </div>
        <button type="submit" class="btn btn-default" value="Login">Login</button>
      </form>   
       <% } else{%>
       <% Person p=(Person)session.getAttribute("person"); %>
       		 <a class="navbar-brand" href="http://localhost:8080/HR-Geo/PersonServlet"><%=p.getName()+" "+p.getSurname()%></a>
       		 <form class="navbar-form navbar-right" action="LogoutServlet" method="post" role="logout">
          		<button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          	</form>
       <%} %>
         
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url(pagePictures/home1.png);"></div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url(pagePictures/home2.jpg);"></div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url(pagePictures/home3.jpg);"></div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
        </header>
     
       
 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 3000 //changes the speed
    })
    </script>
    
      <div class="copyRight" id="copyRight" >
                <div class="col-lg-12">
                    <p>Copyright &copy; HR-geo 2015</p>
                </div>
            </div>
    
</body>
</html>