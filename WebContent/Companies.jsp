<%@page import="backClasses.Company"%>
<%@page import="java.util.ArrayList"%>
<%@page import="backClasses.DataForComp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Companies</title>
</head>
<body>
<%DataForComp d = new DataForComp();
ArrayList<Company> comps = d.getCompList();
for (int i=0; i<comps.size(); i++) {
	out.print("<p>"+comps.get(i).getName()+"</p>");
}
%>
</body>
</html>