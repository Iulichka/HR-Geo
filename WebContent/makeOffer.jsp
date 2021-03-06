<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
 <meta charset="UTF-8">
 <head> 
    <title>Update Profile</title>	
    <link href="css/sear.css" rel="stylesheet">
	<script src="http://snipplicious.com/js/jquery.js"></script>
	<link href="css/search.css" rel="stylesheet" type="text/css">
	<link href="css/advancedSearch.css" rel="stylesheet">
	<link href="css/persons.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@page import="backClasses.*" %>
<%@ page import="java.util.ArrayList" %>
<%if(session.getAttribute("email")==null){
	response.sendRedirect("homePage.jsp");
	return;
 }%>
<%

		//allow access only if session exists	
				ArrayList<String> chosenSkills=new ArrayList<String>();
				int value=1;
				String user =null;	
				ArrayList<String> skills= new ArrayList<String>();
				ArrayList<String> universities=new ArrayList<String>();
				ArrayList<String> faculties=new ArrayList<String>();
				ArrayList<Integer> personIds=(ArrayList<Integer>) session.getAttribute("searchedpersons");
				ArrayList<Person> persons=new ArrayList<Person>();
				DataForPerson data = new DataForPerson();
				skills=data.getSkillNames();
				universities=data.getUniversityNames();
				boolean searched=false;
				faculties=data.getFacultyNames();
					if(session.getAttribute("email")!=null){						
						user=(String)session.getAttribute("email");
						if(personIds!=null){
							searched=true;
							if(personIds.size()>0){
								if(session.getAttribute("cart")==null){
									ArrayList<Integer> cart=new ArrayList<Integer>();
									session.setAttribute("cart", cart);
								}
								for(int i=0;i<personIds.size();i++){
									Person person=data.getPerson(personIds.get(i));
									persons.add(i, person);
								
							}
						}
						}
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
<form action="MakeOfferServlet" method="post" class="form-horizontal" role="form">
<div class="container">
	<div class="row">
	<div class="form-group">
		<div class="col-md-12">
		<label for="contain">Skills:</label>
                <select name ="skills" class="form-control" id="tagPicker" multiple="multiple">
                <% for (int i=0;i<skills.size();i++){ %>
         		<option value=<%=value %>><%=skills.get(i) %></option>
         		 <% 
         			 value++;
         			 }
        			  value=1;
        			 %>
        		</select>  
       		 </div>
       	   </div>       
      					<div class="form-group">
							 <div class="col-md-12">      
							 <label for="contain">Universities:</label>                                                 
                                    <select name="university" class="form-control" id="tagPicker2" multiple="multiple">                                   
                                       <% for (int k=0;k<universities.size();k++){ %>
         								<option value=<%=value %>><%=universities.get(k) %></option>
         								 <% 
         									 value++;
         								 }
        									  value=1;
        								  %>
                                    </select>                                 
                                  </div>
                                  </div>
                                 
                                  <div class="form-group">
                                  <div class="col-md-12">  
                                  <label for="contain">Faculties:</label>                                                     
                                     <select name="faculty" class="form-control" id="tagPicker3" multiple="multiple">                                   
                                       <% for (int i=0;i<faculties.size();i++){ %>
         								<option value=<%=value %>><%=faculties.get(i) %></option>
         								 <% 
         									 value++;
         								 }
        									  value=1;
        								  %>
                                    </select>       
                                  </div>
                                  </div>
                              
                                  <div class="form-group">
                                  <div class="col-md-12"> 
                                    <label for="contain">Minimum Age:</label>
                                    <input class="form-control" name = "age" type="text" />
                                  </div>
                                  </div>
                                  <div class="form-group">
                                  <div class="col-md-12"> 
                                    <label for="contain">Minimum Working Experience:</label>
                                    <input class="form-control" name = "experience" type="text" />
                                  </div>
               
                                  </div>
                                  <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>                                                                                   
                    </div>
                </div>            
		</form>
	<% if(searched==true){
		if(persons.size()>0){				
			
		%>
		<br></br>
		
		<div class="container">
		<div class="row">
		<form action="MakeFinalOffer" method="post">
		<div class="form-group">
          <div class="col-lg-8">
            <input type="text" class="form-control" placeholder="Enter Offer Name" name="offer_name">
          </div>
        </div>
         <div class="form-group">
          <div class="col-lg-8">
            <input class="form-control" placeholder="date" name="date" type="date" >
          </div>
        </div>
	 <div class="form-group">
          <div class="col-lg-8">
           	<textarea cols="104" rows="5" name="about" placeholder="Enter Offer Info"> 
				 
			</textarea>
			<button type="submit" name="makeoffer" class="btn btn-success"  >
         <i class=" glyphicon glyphicon-off icon-white"></i>
         Make Offer
         </button>
          </div>
        </div>
       
        </form>
        <br></br>
        <br></br><br></br>
        <br></br>
        <br></br>
        <br></br>
        <div class="form-group">
    <hgroup class="mb20">
		<h4>            </h4>
		<h2 class="lead"><strong class="text-danger"><%=persons.size() %></strong> results were found for the search </h2>								
	</hgroup>
	<div><form action="PersonAddToCart" method="post">
                  		<input type="hidden" name="alls" value="true">
       			  		<button type="submit"name="SUBMIT" class="btn btn-primary" value="send" >
       			  		<i></i>Add All To List</button>
     </form>
     </div>
	</div>
    <section class="col-xs-12 col-sm-6 col-md-12">
    	<% for(int k=0;k<persons.size();k++){
    	
    	%>
		<article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="GetPersonPicture?id=<%=personIds.get(k)%>"  /></a>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-2">
				<ul class="meta-search">
					<li><i class="glyphicon glyphicon-calendar"></i> <span><%=persons.get(k).getDate() %></span></li>					



					<li><i class="glyphicon glyphicon-tags"></i> <span>Skills</span></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
				<h3><a href="PersonPage?id=<%=data.getPersonId(persons.get(k).getMail())%>&type=open" title=""><%=persons.get(k).getName()+" "+persons.get(k).getSurname() %></a></h3>
				<p><%=persons.get(k).getAbout() %></p>					
			</div>
			<span class="clearfix borda"></span>
		
		<% 
					
					
				if(!data.contains((ArrayList<Integer>)session.getAttribute("cart"), personIds.get(k))){											
					%>
					<form action="PersonAddToCart" method="post">
                  		<input type="hidden" name="person_id" value="<%=personIds.get(k)%>">
       			  		<button type="submit"name="SUBMIT" class="btn btn-primary" value="send" >
       			  		<i class="glyphicon glyphicon-off icon-white"></i>Add To List</button>
       			  </form>
       			  <% }else{
       				  %>
       				  <button type="button" class="btn btn-primary disabled">Already Added</button>
       				  <%} %>
		
       
				<% 
				} %>
				</article>
		</section>
		
</div>

  </div>       
        
<%		
		}
	} 
	%>
	<script src="js/jquery.min.js"></script>
     <script src="js/jquery-ui.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
    <script>
    //Select2
    $.getScript('js/select.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker").select2({
        closeOnSelect:false
      });
    }); //script         
    $(document).ready(function() {});</script>
    <script>
    //Select2
    $.getScript('js/select.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker2").select2({
        closeOnSelect:false
      });
    }); //script         
    $(document).ready(function() {});</script>
    <script>
    //Select2
    $.getScript('js/select.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker3").select2({
        closeOnSelect:false
      });
    }); //script         
    $(document).ready(function() {});</script>

</body>
</html>
