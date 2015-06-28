<!doctype html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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

<%
		//allow access only if session exists						
				String user =null;								
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
<div class="container">
	<div class="row">
		<div class="col-md-12">
            <div class="input-group" id="adv-search">
                <select class="form-control" id="tagPicker" multiple="multiple">
         <option value="1">Java</option>
          <option value="2">Php</option>
          <option selected="selected" value="3">MySQL</option>
          <option value="4">Github</option>
          <option selected="selected" value="5">Javascript</option>
          <option value="6">Linux</option>
          <option value="7">Insects</option>
        </select>  
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">University:</label>
                                    <select class="form-control">
                                        <option value="0" selected>All Universities</option>
                                        <option value="1">Free University</option>
                                        <option value="2">Tbilisi State University</option>
                                        <option value="3">Georgia University</option>
                                        <option value="4">Harvard University</option>
                                    </select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Faculty</label>
                                    <select class="form-control">
                                        <option value="0" selected>All Faculties</option>
                                        <option value="1">Mathematics</option>
                                        <option value="2">Programming</option>
                                        <option value="3">Physics</option>
                                        <option value="4">Chemistry</option>
                                    </select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Minimum Age</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </div>
                </div>
            </div>
          </div>
        </div>
	</div>
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

</body>
</html>