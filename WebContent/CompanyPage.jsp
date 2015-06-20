<%@page import="backClasses.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><% Company c = (Company)request.getAttribute("comp");
out.println(c.getName()); %></title>
</head>
<body>
<div class ="page-header" id="name" style="text-shadow: aqua; font-size: 24pt; padding-bottom: 20pt;">
<h1>
<%
out.println(c.getName());
%>
</h1>
</div>
<div id="info">
<% out.println(c.getInfo()); %>
</div>
<div  class="navbar-text" id="contact" style=" position: absolute; left: 60%;">
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
</body>
</html>