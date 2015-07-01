<%@page import="backClasses.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backClasses.DataForComp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Companies</title>
</head>
<body>
<%@include  file="bootstrap.html" %>
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
<div class="list-group" style="width: 50%; left: 25%; position: absolute;">
<%if(session.getAttribute("email")==null){
	response.sendRedirect("homePage.jsp");
 }%>
<%DataForComp d = new DataForComp();
ArrayList<Company> comps = d.getCompList();
for (int i=0; i<comps.size(); i++) {
	String s = " ";
	out.print("<span style=\"color: red;\">");
	double rating = comps.get(i).getRating();
	for (int j=0; j<rating; j++) {
		s=s+"☆";
	}
	out.print("</span>");
	out.print("<a href=\"CompanyPage?mail="+comps.get(i).getMail()+"\" class=\"list-group-item\""+"\""+">"+comps.get(i).getName()+"  " +s+rating+"</a>");
}
%>
</div>
</body>
</html>