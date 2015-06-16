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
<div>
<%DataForComp d = new DataForComp();
ArrayList<Company> comps = d.getCompList();
for (int i=0; i<comps.size(); i++) {
	out.print("<li>");
	out.print("<a href=\"CompanyPage?mail="+comps.get(i).getMail()+"\""+">"+comps.get(i).getName()+"</a>");
	out.print("</li>");
}
%>
</div>
</body>
</html>