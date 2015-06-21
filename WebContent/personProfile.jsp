<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Person Profile</title>
</head>
<body>
<%@ page import="backClasses.Company" %>
<%@ page import="backClasses.Offer" %>
<%@ page import="backClasses.DBSelect" %>
<%@ page import="backClasses.Person" %>
<%@ page import="backClasses.PersonSkills" %>
<%@ page import="backClasses.OverallExperience" %>
<%@ page import="backClasses.PersonOffer" %>
<%@ page import="java.util.ArrayList" %>
		<%
		//allow access only if session exists
				String company="CompanyPage?mail=socar@yahoo.com";
				String user =null;
				String first_name = null;
				String last_name = null;
				Person pers=null;
				PersonSkills skills=null;
				OverallExperience experience=null;
				ArrayList<PersonOffer> personOffers=null;
				if(session.getAttribute("first_name")==null){
					if(session.getAttribute("email")!=null){
						pers=(Person)request.getAttribute("person");
						skills=(PersonSkills)request.getAttribute("skills");
						experience=(OverallExperience)request.getAttribute("experience");
						user=pers.getName()+" "+pers.getSurname();
						personOffers=(ArrayList<PersonOffer>)request.getAttribute("personOffers");
						
					}else{
		   			 	response.sendRedirect("homePage.jsp");
					}
				}else{
					user = (String)session.getAttribute("first_name")+" "+(String)session.getAttribute("last_name");
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
      <a class="navbar-brand" href="http://localhost:8080/HR-Geo/PersonServlet"><%=user%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Registration <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="companyRegister.jsp">Register Company</a></li>
            <li><a href="personRegister.jsp">Register Person</a></li>
          </ul>
        </li>       
      </ul>
      	 <form class="navbar-form navbar-right" action="LogoutServlet" method="post" role="logout">
          <button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container">	
	<div class="row">
		<div class="col-md-offset-2 col-md-8 col-lg-offset-3 col-lg-6">
    	 <div class="well profile">
            <div class="col-sm-12">
                <div class="col-xs-12 col-sm-8">                	 				
                	<h2><%=user%></h2>
                    <p><strong>About: </strong><%=pers.getAbout() %> </p>
                    <p><strong>Birth Date: </strong><%=pers.getDate()%> </p>
                    <p><strong>Skills: </strong>
                    <%for(int i=0;i<skills.getPersonSkills().size();i++){ %>
                    	<%if(skills!=null){ %>
                    		<span class="label label-primary"><%=skills.getPersonSkills().get(i).getName() %></span> 
                		<%} %>
                    <%} %>
                    </p>
                </div>             
                <div class="col-xs-12 col-sm-4 text-center">
                    <figure>
                        <img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="" class="img-circle img-responsive">
                    </figure>
                </div>
            </div> 
                       
            <div class="col-xs-12 divider text-center">
                <div class="col-xs-12 col-sm-4 emphasis">                  
                    <p><small> Update Profile</small></p>
                    <a href="personProfileUpdate.jsp" class="btn btn-success btn-block" role="button"><span class="fa fa-plus-circle"></span>Update Profile</a>                  
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                                     
                    <p><small> Offers</small></p>
                    <button class="btn btn-info btn-block"><span class="fa fa-user"></span> Offers</button>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                   
                    <p><small>Options</small></p>
                    <div class="btn-group dropup btn-block">
                      <button type="button" class="btn btn-primary"><span class="fa fa-gear"></span> Options </button>
                      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu text-left" role="menu">
                        <li><a href="#"><span class="fa fa-envelope pull-right"></span> Send an email to company </a></li>
                        <li><a href="#"><span class="fa fa-list pull-right"></span> Log Out </a></li>
                        <li class="divider"></li>
                        <li><a href="#"><span class="fa fa-warning pull-right"></span>delete my account</a></li>
                        <li class="divider"></li>
                        <li><a href="#" class="btn disabled" role="button"> Ragaca </a></li>
                      </ul>
                    </div>
                </div>
            </div>
    	 </div>                 
		</div>
	</div>
</div>	
<table class="table table-hover">
<thead><tr><th>Offer Name</th><th>Company</th><th>Offer Recieved</th><th>Offer End Date</th><th>Offer Status</th></tr></thead>
<tbody>
		<%for(int i=0;i<personOffers.size();i++){ %>
			<% 
			Offer offer=null;
			PersonOffer perOff=personOffers.get(i);
			DBSelect select= new DBSelect();
			offer = select.getOffer(perOff.getOfferID());	
			Company comp=offer.getCompany();
	%>		
                    	<tr class= <%=perOff.getOfferState() %>>
                    		<td><%= offer.getName() %></td> 
                    		<td><%= comp.getName() %></td> 
                    		<td><%= offer.getStartDate() %></td> 
                    		<td><%= offer.getEndDate() %></td> 
                    		<td><%= perOff.getOfferState() %></td>
                    	</tr>
              <%} %>
                 
 </tbody>
</table>

</body>
</html>