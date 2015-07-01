<%@page import="java.util.ArrayList"%>
<%@page import="backClasses.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<%@include  file="navigation.html" %>
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