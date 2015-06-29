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
    	  var xmlht1 = new XMLHttpRequest();
  		xmlht1.open("GET", "ChartData?type=skills", false);
  		xmlht1.send();
  		var resp1 = xmlht1.responseText;
  		var arr1 = resp1.split(" ");
    	  var data1 = google.visualization.arrayToDataTable([
    	    ['Skill', 'pre_intermadiate','Novice', 'Intermadiate', 'Begginer', 'Advance/Expert', { role: 'annotation' } ],
    	    [arr1[1], parseInt(arr1[2]), parseInt(arr1[3]), parseInt(arr1[4]),parseInt(arr1[5]),parseInt(arr1[6]),''],
    	    [arr1[7], parseInt(arr1[8]), parseInt(arr1[9]), parseInt(arr1[10]),parseInt(arr1[11]),parseInt(arr1[12]),''],
    	    [arr1[13], parseInt(arr1[14]), parseInt(arr1[15]), parseInt(arr1[16]),parseInt(arr1[17]),parseInt(arr1[18]),''],
    	    [arr1[19], parseInt(arr1[20]), parseInt(arr1[21]), parseInt(arr1[22]),parseInt(arr1[23]),parseInt(arr1[24]),''],
    	    [arr1[25], parseInt(arr1[26]), parseInt(arr1[27]), parseInt(arr1[28]),parseInt(arr1[29]),parseInt(arr1[30]),''],
    	    [arr1[31], parseInt(arr1[32]), parseInt(arr1[33]), parseInt(arr1[34]),parseInt(arr1[35]),parseInt(arr1[36]),''],
    	    [arr1[37], parseInt(arr1[38]), parseInt(arr1[39]), parseInt(arr1[40]),parseInt(arr1[41]),parseInt(arr1[42]),''],
    	    [arr1[43], parseInt(arr1[44]), parseInt(arr1[45]), parseInt(arr1[46]),parseInt(arr1[47]),parseInt(arr1[48]),''],
    	    [arr1[49], parseInt(arr1[50]), parseInt(arr1[51]), parseInt(arr1[52]),parseInt(arr1[53]),parseInt(arr1[54]),''],
    	    [arr1[55], parseInt(arr1[56]), parseInt(arr1[57]), parseInt(arr1[58]),parseInt(arr1[59]),parseInt(arr1[60]),'']
    	   ]);

          var options1 = {
            width: 900,
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
          title: 'gender proportion',
          pieHole: 0.4,
        };
        
        var chart1 = new google.visualization.ColumnChart(document.getElementById('top_x_div'));
        chart1.draw(data1, options1);

        var chart2 = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart2.draw(data2, options2);
 
      };
    </script>
  </head>
  <body>
  	<%@include  file="bootstrap.html" %>
  	<%@include file="navigation.html" %>
  	<h3>Skills Market <span class="label label-primary">make it more efficient</span></h3>
    <div id="top_x_div" style="width: 100%; height: 500px; "></div>
    <h3>On the Way of Gender Balance <span class="label label-primary">Chart</span></h3>
     <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
</html>