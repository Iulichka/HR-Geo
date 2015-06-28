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
    	  var xmlhttp = new XMLHttpRequest();
    		xmlhttp.open("GET", "ChartData", false);
    		xmlhttp.send();
    		var resp = xmlhttp.responseText;
    		var tx =  parseInt(resp);
    		var arr = resp.split(" ");
        var data = new google.visualization.arrayToDataTable([
          ['Opening Move', 'Percentage'],
          ["King's pawn (e4)", parseInt(arr[0])],
          ["Queen's pawn (d4)", 31],
          ["Knight to King 3 (Nf3)", 12],
          ["Queen's bishop pawn (c4)", 10],
          ['Other', 3]
        ]);

        var options = {
          title: 'Chess opening moves',
          width: 900,
          legend: { position: 'none' },
          chart: { title: 'Chess opening moves',
                   subtitle: 'popularity by percentage' },
          bars: 'vertical', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Percentage'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };
        
        var data2 = google.visualization.arrayToDataTable([
                                                          ['Task', 'Hours per Day'],
                                                          ['Work',     11],
                                                          ['Eat',      2],
                                                          ['Commute',  2],
                                                          ['Watch TV', 2],
                                                          ['Sleep',    7]
                                                        ]);

                                                        var options2 = {
                                                          title: 'My Daily Activities',
                                                          pieHole: 0.4,
                                                        };

                                                        var chart2 = new google.visualization.PieChart(document.getElementById('donutchart'));
                                                        chart2.draw(data2, options2);

        var chart1 = new google.charts.Bar(document.getElementById('top_x_div'));
        chart1.draw(data, options);
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