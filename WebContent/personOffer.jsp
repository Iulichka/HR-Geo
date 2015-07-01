<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<head>
 <meta charset="UTF-8">
 <head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link id="bs-css" href="css/bootstrap-cerulean.min.css" rel="stylesheet">
<title>Offer Page</title>
</head>
<body>
<%@ page import="backClasses.*" %>
<%
		//allow access only if session exists	
				DataForPerson data= new DataForPerson();
				Company comp = null;
				String user =null;
				String person=null;
				Person pers=null;
				AllOffersForPerson personOffers=null;				
				Offer o=null;
					if(request.getSession()!=null && session.getAttribute("email")!=null && session.getAttribute("person")!=null  ){	
						pers=(Person)request.getAttribute("person");
						int offerID=(Integer)request.getAttribute("offerid");						
						personOffers=data.getOffers(data.getPersonId(pers.getMail()));
						o=personOffers.getMyOffer(offerID);
						comp=data.getCompany(offerID);
						user=comp.getName();
						person=pers.getName()+" "+pers.getSurname();
						
					}else{
		   			 	response.sendRedirect("homePage.jsp");
		   			 	return;
					}
%>   
<nav class="navbar navbar-default">
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
                    <p><strong>Offer Info: </strong> <%=o.getText() %> </p>                                                                             
                </div>                            
            </div>
            <p><small>.</small></p> 
	   <a href="http://localhost:8080/HR-Geo/PersonServlet" class="btn btn-primary btn-block" role="button"><span class="fa fa-plus-circle"></span>Back To Profile</a>                        
    	 </div>                 
	  </div>
	  
	  
	</div>
	     
  </div>
   
  <br></br>

</body>
</html>