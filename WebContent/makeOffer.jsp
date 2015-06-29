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
<%
		//allow access only if session exists	
		ArrayList<String> chosenSkills=new ArrayList<String>();
				int value=1;
				String user =null;	
				ArrayList<String> skills= new ArrayList<String>();
				ArrayList<String> universities=new ArrayList<String>();
				ArrayList<String> faculties=new ArrayList<String>();
				DataForPerson data= new DataForPerson();
				skills=data.getSkillNames();
				universities=data.getUniversityNames();
				faculties=data.getFacultyNames();
					if(session.getAttribute("email")!=null){						
						user=(String)session.getAttribute("email");
						
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
      <a class="navbar-brand" href="http://localhost:8080/HR-Geo/CompanyServlet"><%=user%></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
      <form class="navbar-form navbar-right" action="LogoutServlet" method="post">
          <button type="submit" class="btn btn-default" value="Logout">Log Out</button>
          </form>   	         
    </div>
  </div>
</nav>
<form action="MakeOfferServlet" method="post" class="form-horizontal" role="form">
<div class="container">
	<div class="row">
	<div class="form-group">
		<div class="col-md-12">
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
                                    <label for="contain">Minimum Age</label>
                                    <input class="form-control" name = "age" type="text" />
                                  </div>
                                  </div>
                                  <div class="form-group">
                                  <div class="col-md-12"> 
                                    <label for="contain">Working Experience</label>
                                    <input class="form-control" name = "experience" type="text" />
                                  </div>
                                  </div>
                                  <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                
                           
                        
                    </div>
                </div>
            
	</form>
<div class="container">
    <hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead"><strong class="text-danger">3</strong> results were found for the search for <strong class="text-danger">Lorem</strong></h2>								
	</hgroup>

    <section class="col-xs-12 col-sm-6 col-md-12">
		<article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="Lorem ipsum" /></a>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-2">
				<ul class="meta-search">
					<li><i class="glyphicon glyphicon-calendar"></i> <span>02/15/2014</span></li>					
					<li><i class="glyphicon glyphicon-tags"></i> <span>Skills</span></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
				<h3><a href="#" title="">Person Name, Age</a></h3>
				<p>Information About Person</p>						
                <span class="plus"><a href="#" title="Lorem ipsum"><i class="glyphicon glyphicon-plus"></i></a></span>
			</div>
			<span class="clearfix borda"></span>
		</article>

       <article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="Lorem ipsum" /></a>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-2">
				<ul class="meta-search">
					<li><i class="glyphicon glyphicon-calendar"></i> <span>02/15/2014</span></li>					
					<li><i class="glyphicon glyphicon-tags"></i> <span>Skills</span></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
				<h3><a href="#" title="">Person Name, Age</a></h3>
				<p>Information About Person</p>						
                <span class="plus"><a href="#" title="Lorem ipsum"><i class="glyphicon glyphicon-plus"></i></a></span>
			</div>
			<span class="clearfix borda"></span>
		</article>
<article class="search-result row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<a href="#" title="Lorem ipsum" class="thumbnail"><img src="http://dc693.4shared.com/img/yuQEeqLc/s3/142cae080e0/Anonymous_Facebook_Profile_Pic" alt="Lorem ipsum" /></a>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-2">
				<ul class="meta-search">
					<li><i class="glyphicon glyphicon-calendar"></i> <span>02/15/2014</span></li>					
					<li><i class="glyphicon glyphicon-tags"></i> <span>Skills</span></li>
				</ul>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
				<h3><a href="#" title="">Person Name, Age</a></h3>
				<p>Information About Person</p>						
                <span class="plus"><a href="#" title="Lorem ipsum"><i class="glyphicon glyphicon-plus"></i></a></span>
			</div>
			<span class="clearfix border"></span>
		</article>			

	</section>
</div>
	<script src="js/jquery.min.js"></script>
     <script src="js/jquery-ui.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
    <script>
    //Select2
    $.getScript('http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.8/select2.min.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker").select2({
        closeOnSelect:false
      });

    }); //script         

    $(document).ready(function() {});</script>
    <script>
    //Select2
    $.getScript('http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.8/select2.min.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker2").select2({
        closeOnSelect:false
      });

    }); //script         

    $(document).ready(function() {});</script>
    <script>
    //Select2
    $.getScript('http://cdnjs.cloudflare.com/ajax/libs/select2/3.4.8/select2.min.js',function(){
                    
      /* Select2 plugin as tagpicker */
      $("#tagPicker3").select2({
        closeOnSelect:false
      });

    }); //script         

    $(document).ready(function() {});</script>

</body>
</html>