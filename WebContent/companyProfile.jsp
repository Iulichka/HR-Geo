<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="backClasses.DataForPerson"%>
<%@page import="backClasses.AllOffersForPerson"%>
<html>
<head>
 <meta charset="utf-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Company Profile</title>
</head>
<body>
<%@ page import="backClasses.Company" %>
<%@ page import="backClasses.Offer" %>
<%@ page import="backClasses.DBSelect" %>
<%@ page import="backClasses.Person" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Iterator" %>


<%
		//allow access only if session exists		
				Offer offer=null;
				Offer o=null;
				String user =null;			
				Company comp=null;
				Map <Offer,ArrayList<Person>> map = new HashMap<Offer,ArrayList<Person>>();
					if(request.getSession()!=null && session.getAttribute("email")!=null && request.getAttribute("person")==null){
						comp=(Company)request.getAttribute("company");
						session.setAttribute("fullCompany", comp);
						if(comp!=null)
						user=comp.getName();
						map=(HashMap<Offer,ArrayList<Person>>)request.getAttribute("offers");
																
					}else{
		   			 	response.sendRedirect("homePage.jsp");
		   			 	return;
					}						
			
%>   
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

<div class="container">
	<div class="row">
		<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
    	 <div class="well profile">
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-8">
                    <h2><%= user %></h2>                  
                    <p><strong>Company Site: </strong> <%=comp.getSite() %> </p>
                    <p><strong>Company Telephone: </strong> <%=comp.getTel() %> </p>
                     <p><strong>Company Info: </strong> <%=comp.getInfo() %> </p>                                                        
                </div>                            
            </div>            
            <div class="col-xs-12 divider text-center">
                <div class="col-xs-12 col-sm-4 emphasis">                                     
                    <a href="companyProfileUpdate.jsp" class="btn btn-primary btn-block" role="button">Update Profile</a> 
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                 
                    <a href="makeOffer.jsp" class="btn btn-success btn-block" role="button">Make Offer</a> 
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                 
                    <a href="companyPhotoes.jsp?mail=<%=comp.getMail() %>" class="btn btn-info btn-block" role="button">Company Photoes</a>
                </div>
            </div>
    	 </div>                 
		</div>
	</div>
	</div>
	<br></br>
	
<div class="container">
  <div class="panel-group" id="accordion">
 	<%
 	int id=1;
 	for (Map.Entry<Offer,ArrayList<Person>> entry : map.entrySet()) {
 	    Offer key = entry.getKey();
 	    ArrayList<Person> value = entry.getValue();
 	    String collapseHREF="#collapse"+id;
 	    String collapseID="collapse"+id;
 	    
	%>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href=<%=collapseHREF %>><%=key.getName() %></a>
        </h4>
      </div>
      <div id=<%=collapseID %> class="panel-collapse collapse in">
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Offer Name</th><th>Person Name</th><th>Offer Sent</th><th>Offer End Date</th><th>Offer Status</th><th>Person Page</th></tr></thead>														
					<tbody>
						<%							
							for(int i=0;i<value.size();i++){								
								DBSelect select= new DBSelect();								
								Person pers=value.get(i);		
								DataForPerson data=new DataForPerson();
								//o=select.getOffer(key.getOfferID());
								AllOffersForPerson personOffers=data.getOffers(data.getPersonId(pers.getMail()));
								o=personOffers.getMyOffer(key.getOfferID());
								
							%>
           				<tr class=<%=o.getStatus() %>>
                    		<td><%=key.getName()%></td> 
                    		<td><%=pers.getName()+" "+pers.getSurname() %></td> 
                    		<td><%=key.getStartDate()%></td> 
                    		<td><%=key.getEndDate()%></td> 
                    		<td><%=o.getStatus() %></td>
                    		<form action="GoToPersonPage" method="post">
                    		 <td class="center">
        					 <input type="hidden" name="offer_status" value="<%=o.getStatus()%>">
        					 <input type="hidden" name="person_id" value="<%=data.getPersonId(pers.getMail())%>">
        					 <button type="submit"name="SUBMIT" class="btn btn-primary" value="page" >
        					<i class=" glyphicon glyphicon-off icon-white"></i>
        					 Person Page
        					 </button>
        					 </td>
        					 </form>
                    	</tr>   
                    	<% } %>       
           				
       		      				                      	                      
 				</tbody>
			</table>
        </div>
      </div>
    </div>
 
 	<%
 	id++;
 	} %>
    </div>
  </div>
</body>
</html>