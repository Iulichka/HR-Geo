<%@page import="backClasses.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backClasses.DataForComp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Companies</title>
</head>
<body>
<%@include  file="bootstrap.html" %>
<%@include  file="navigation.html" %>
<div class="list-group" style="width: 50%; left: 25%; position: absolute;">
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