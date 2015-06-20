<%@page import="backClasses.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include  file="bootstrap.html" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><% Company c = (Company)request.getAttribute("comp");
out.println(c.getName()); %></title>
</head>
<body>
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
<a href="http://<%out.println(c.getSite()); %>">
<%
out.println(c.getSite());
%>
</a>
</div>
<div id="mail">
<%
out.println("e-mail: "+ c.getMail());
%>
</div>
</div>
<div id="rating">
<%
out.println("rating: "+c.getRating());
%>
</div>
<div class="row">
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="http://www.interviewbay.com/blog/wp-content/uploads/2013/04/deloitte.jpg" alt="...">
    </a>
  </div>
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img src="http://www.interviewbay.com/blog/wp-content/uploads/2013/04/deloitte.jpg" alt="...">
    </a>
  </div>
</div>
<div id="info" style="padding-left: 10pt; font-size: 14pt">
<% out.println(c.getInfo()); %>
</div>
</body>
</html>