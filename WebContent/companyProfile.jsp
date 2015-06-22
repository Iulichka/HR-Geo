<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
                    <h2>Company Name</h2>                  
                    <p><strong>Company Site: </strong> www.company.ge </p>
                    <p><strong>Company Telephone: </strong> 599-35-65-41 </p>
                     <p><strong>Company Info: </strong> Information About Company </p>                                                        
                </div>                            
            </div>            
            <div class="col-xs-12 divider text-center">
                <div class="col-xs-12 col-sm-4 emphasis">                                     
                    <button class="btn btn-success btn-block"><span class="fa fa-plus-circle"></span> Update Profile </button>
                </div>
                <div class="col-xs-12 col-sm-4 emphasis">                 
                    <button class="btn btn-info btn-block"><span class="fa fa-user"></span> Make Offer </button>
                </div>
            </div>
    	 </div>                 
		</div>
	</div>
	</div>
	<br></br>
	
<div class="container">
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Java Programmer</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Offer Name</th><th>Person Name</th><th>Offer Sent</th><th>Offer End Date</th><th>Offer Status</th></tr></thead>
					<tbody>
						<tr class= "danger">
                    		<td>Java Programmer</td> 
                    		<td>Dato Chkhatarashvili</td> 
                    		<td>2015-05-13</td> 
                    		<td>2015-06-17</td> 
                    		<td>danger</td>
                    	</tr>    
                    	<tr class= "success">
                    		<td>Java Programmer</td> 
                    		<td>Galaktion Tabidze</td> 
                    		<td>2015-05-13</td> 
                    		<td>2015-06-17</td> 
                    		<td>success</td>
                    	</tr>                             
 				</tbody>
			</table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">PHP Programmer</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body">
        
        <table class="table table-hover">          
			<thead><tr><th>Offer Name</th><th>Person Name</th><th>Offer Sent</th><th>Offer End Date</th><th>Offer Status</th></tr></thead>
					<tbody>
						<tr class= "success">
                    		<td>PHP Programmer</td> 
                    		<td>Luka Razikashvili</td> 
                    		<td>2015-03-14</td> 
                    		<td>2015-05-18</td> 
                    		<td>success</td>
                    	</tr>   
                    	<tr class= "warning">
                    		<td>PHP Programmer</td> 
                    		<td>Mikheil Javakhishvili</td> 
                    		<td>2015-03-14</td> 
                    		<td>2015-05-18</td> 
                    		<td>success</td>
                    	</tr>     
                    	<tr class= "active">
                    		<td>PHP Programmer</td> 
                    		<td>Konstantine Gamsakhurdia</td> 
                    		<td>2015-03-14</td> 
                    		<td>2015-05-18</td> 
                    		<td>success</td>
                    	</tr>                               
 				</tbody>
			</table>
			
        </div>
      </div>
    </div>
    
      <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Taxi Driver</a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body">
        <table class="table table-hover">          
			<thead><tr><th>Offer Name</th><th>Person Name</th><th>Offer Sent</th><th>Offer End Date</th><th>Offer Status</th></tr></thead>
					<tbody>
						<tr class= "success">
                    		<td>Taxi Driver</td> 
                    		<td>Luka Razikashvili</td> 
                    		<td>2015-03-14</td> 
                    		<td>2015-05-18</td> 
                    		<td>success</td>
                    </tr>                             
 				</tbody>
			</table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>