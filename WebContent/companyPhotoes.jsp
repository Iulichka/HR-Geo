<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/thumbnail-gallery.css" rel="stylesheet">
<title><%=request.getParameter("mail") %></title>
</head>
<body>
<%@page import="backClasses.DataForComp"%>
<%@page import="backClasses.Company"%>
    <div class="container">
        <div class="row">
        <h3>Company Photos</h3>
            <% 
            
            Company c = (Company)session.getAttribute("fullCompany");
 for (int i=1; i<=c.getImagesNum(); i++) {
	out.print("<div class=\"col-lg-3 col-md-4 col-xs-6 thumb\">");
	out.print("<a href=\"#\" class=\"thumbnail\">");
	String mail = c.getMail();
	out.print("<img class=\"img-responsive\" src=\"CompImage?mail="+mail+
			"&num="+i+"&type=image/jpeg"+"\">");
	out.print("</a></div>");
}
%>
        </div>

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; HR-geo 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>