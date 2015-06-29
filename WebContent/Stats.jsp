<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Statistics</title>
<head>
    <script type="text/javascript" src="js/charts.js"></script>
    <script type="text/javascript">
      google.load("visualization", "1.1", {packages:["bar","corechart"]});
      google.setOnLoadCallback(drawStuff);

      function drawStuff() {
    	  var data = google.visualization.arrayToDataTable([
    	    ['Genre', 'Fantasy & Sci Fi','skill', { role: 'annotation' } ],
    	    ['2010', 10, 24,''],
    	    ['2020', 16, 22, ''],
    	    ['2030', 28, 19, '']
    	   ]);

          var options = {
            width: 600,
            height: 400,
            legend: { position: 'top', maxLines: 3 },
            bar: { groupWidth: '75%' },
            isStacked: true,
          };

        var xmlht = new XMLHttpRequest();
		xmlht.open("GET", "ChartData?type=gender", false);
		xmlht.send();
		var resp2 = xmlht.responseText;
		var arr2 = resp2.split(" ");
        var data2 = google.visualization.arrayToDataTable([
                ['Gender', 'Quantity'],
                ['Male',     parseInt(arr2[0])],
                ['Female',     parseInt(arr2[1])]
              ]);

        var options2 = {
          title: 'gender balance',
          pieHole: 0.4,
        };
        
        var chart1 = new google.visualization.ColumnChart(document.getElementById('top_x_div'));
        chart1.draw(data, options);

        var chart2 = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart2.draw(data2, options2);
 
       // var chart = new google.charts.Bar(document.getElementById('top'));
       // chart.draw(data, options);
      };
    </script>
  </head>
  <body>
  	<%@include  file="bootstrap.html" %>
  	<%@include file="navigation.html" %>
    <div id="top_x_div" style="width: 900px; height: 500px; "></div>
     <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
</html>