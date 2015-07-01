<%@page import="java.util.ArrayList"%>
<%@page import="backClasses.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>

<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>
<% Company c = (Company)request.getAttribute("comp");
	out.println(c.getName()); %>
</title>
<script type="text/javascript">
var bool = true;
function fun1(n, mail){
	if(!bool) {
		document.getElementById("message").innerHTML="you heve allready voted";
	} else {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "Rating?n="+n+"&mail="+mail, false);
	xmlhttp.send();
	var tx =  xmlhttp.responseText;
	bool = false;
	document.getElementById("message").innerHTML="thank you for voting";
	document.getElementById("ratingValue").innerHTML=tx;
	}
}
</script>
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
<div class ="page-header" id="name" style="text-shadow: aqua; font-size: 24pt; padding-bottom: 20pt; padding-left: 10pt">
<h1>
<%
out.println(c.getName());
%>
</h1>
</div>
<div  class="navbar-text" id="contact" style="position: absolute; left: 60%; top: 40%;">
<div id="tel">
<%
out.println("tel: "+c.getTel());
%>
</div>
<div id="site">
site:
<a href="http://<% out.println(c.getSite()); %>">
<%
out.println(c.getSite());
%>
</a>
<br></br>
    <a href="companyPhotoes.jsp?mail=<%=c.getMail()%>&type=gal">view gallery</a>
</div>
<div id="mail">
<%
out.println("e-mail: "+ c.getMail());
%>
</div>
</div>
<div class="row">
<%
for (int i=1; i<=c.getImagesNum(); i++) {
	if (i==3) break;
	out.print("<div class=\"col-xs-6 col-md-3\">");
	out.print("<a href=\"#\" class=\"thumbnail\">");
	String mail = c.getMail();
	out.print("<img src=\"CompImage?mail="+mail+"&num="+i+"&type=image/jpeg"+"\">");
	out.print("</a></div>");
}
%>
</div>
<div id="info" style="padding-left: 10pt; font-size: 14pt">
<%  out.println(c.getInfo()); %>
</div>
 <div class="col-xs-12 col-sm-3 text-center" id="rating" style="position: absolute; left: 52%; top: 15%; font-size: 16pt;">         
   <figcaption class="ratings">
                            <p>Rating <tt id="ratingValue"><%= c.getRating() %></tt>
 <%
 for (int i=0; i<5; i++) {
	 String filledStar ="";
	 if (i >= c.getRating()) filledStar = "-o"; //,"+c.getMail()+"
	 String mail = "\""+c.getMail()+"\"";
	 out.print("<a href=\"#\" onclick='fun1("+i+","+mail+")'>");
	 out.print("<span class=\"fa fa-star"+filledStar+"\"></span></a>");
 }
 %>             
        </p>
     </figcaption>
     <p id="message"style="font-size: 9pt"></p>
   </div>
   
<div class="copyRight" id="copyRight" style="font-size: 12pt;
	text-align: center;
	bottom: inherit;
	padding-top: 200pt;" >
                <div class="col-lg-12">
                    <p>Copyright &copy; HR-geo 2015</p>
                </div>
            </div>
</body>
</html>