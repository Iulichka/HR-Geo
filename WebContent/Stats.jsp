<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
  		// this sequence must nt be changed
  		var newAr = [['Skill', 'Advance/Expert','Begginer', 'Intermadiate', 'Novice', 'pre_intermadiate' ]];
  		for (i=1; i<arr1.length; i=i) {
  			var tempAr =[];
  			for (j=0; j<6; j++) {
  				if (j>0) {
  					tempAr[j] = parseInt(arr1[i]);
  				} else {
  					tempAr[j] = arr1[i];
  				}
  				i++;
  			}
			newAr[newAr.length] = tempAr;
		}
    	  var data1 = google.visualization.arrayToDataTable(newAr);
          var options1 = {
            width: 900,
            height: 400,
            legend: { position: 'top', maxLines: 3 },
            bar: { groupWidth: '75%' },
            isStacked: true,
          };
        // gender --------------------------------------------------------------  
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
        // skillDemand --------------------------------------------------------
        var xmlht3 = new XMLHttpRequest();
  		xmlht3.open("GET", "ChartData?type=skillsDemand", false);
  		xmlht3.send();
  		var resp3 = xmlht3.responseText;
  		var arr3 = resp3.split(" ");
  		var myAr = [ ['Gender', 'Quantity']];
		for ( i=0; i<arr3.length; i++) {
			var tempAr =[];
			tempAr[0] = arr3[i];
			i++;
			tempAr[1] = parseInt(arr3[i]);
			myAr[myAr.length] = tempAr;
		}
		
		var data3 = google.visualization.arrayToDataTable(myAr);
		var options3 = {
		          title: 'Skills Searched',
		          pieHole: 0.4,
		          is3D: true,
		 };
		// uni ---------------------------------------------
		  var xmlht4 = new XMLHttpRequest();
	  		xmlht4.open("GET", "ChartData?type=uniStat", false);
	  		xmlht4.send();
	  		var resp4 = xmlht4.responseText;
	  		var arr4 = resp4.split(" ");
	  		var newAr4 = [['უნივერსიტეტი', 'ბალკალავრი', 'მაგისტრი', 'დოქტორი' ]];
	  		for (i=1; i<arr4.length; i=i) {
	  			var tempAr4 =[];
	  			for (j=0; j<6; j++) {
	  				if(j<4) {
		  				if (j>0) {
		  					tempAr4[j] = parseInt(arr4[i]);
		  				} else {
		  					tempAr4[j] = arr4[i];
		  				}
	  				}
	  				i++;
	  			}
				newAr4[newAr4.length] = tempAr4;
			}
	    	  var data4 = google.visualization.arrayToDataTable(newAr4);
	          var options4 = {
	            width: 900,
	            height: 400,
	            legend: { position: 'top', maxLines: 3 },
	            bar: { groupWidth: '75%' },
	            isStacked: true,
	          };
		
	    // faculties ------------------------------------------------------
	    var xmlht5 = new XMLHttpRequest();
	  		xmlht5.open("GET", "ChartData?type=faculty", false);
	  		xmlht5.send();
	  		var resp5 = xmlht5.responseText;
	  		var arr5 = resp5.split(" ");
	  		var newAr5 = [['Profession', 'Quantity', { role: 'style' } ]];
	    for ( i=0; i<arr5.length; i++) {
			var tempAr =[];
			tempAr[0] = arr5[i];
			i++;
			tempAr[1] = parseInt(arr5[i]);
			tempAr[2] = 'color: gold';
			newAr5[newAr5.length] = tempAr;
		}
	    var data5 = google.visualization.arrayToDataTable(newAr5);
	    var options5 = {
         title: "popular faculties",
         width: 900,
         height: 400,
         bar: {groupWidth: "40%"},
         legend: { position: "none" },
         };
	    
        var chart1 = new google.visualization.ColumnChart(document.getElementById('top_x_div'));
        chart1.draw(data1, options1);
        var chart2 = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart2.draw(data2, options2);
        var chart3 = new google.visualization.PieChart(document.getElementById('skilldemand'));
        chart3.draw(data3, options3);
        var chart4 = new google.visualization.ColumnChart(document.getElementById('unies'));
        chart4.draw(data4, options4);
        var chart5 = new google.visualization.ColumnChart(document.getElementById('prof'));
        chart5.draw(data5, options5);
 
      };
    </script>
  </head>
  <body>
  	<%@include  file="bootstrap.html" %>
  	<%@include file="navigation.html" %>
  	<h3>Skills Market <span class="label label-primary">make it more efficient</span></h3>
    <div id="top_x_div" style="width: 100%; height: 500px; "></div>
    <div style="padding-left: 40%;">
    <h3>Gender Balance <span class="label label-primary">Chart</span></h3>
     <div id="donutchart" style="width: 900px; height: 500px;"></div>
     </div>
     <h3>Skills <span class="label label-primary">Demand</span></h3>
     <div id="skilldemand" style="width: 900px; height: 500px;"></div>
     
      <div style="padding-left: 40%;">
    <h3>Universities <span class="label label-primary">Degree</span></h3>
     <div id="unies" style="width: 900px; height: 500px;"></div>
     </div>
     <h3>Professions <span class="label label-primary">Quantity</span></h3>
     <div id="prof" style="width: 900px; height: 500px;"></div>
     
     <div class="copyRight" id="copyRight" style="text-align: center; font-size: 12pt" >
                <div class="col-lg-12">
                    <p>Copyright &copy; HR-geo 2015</p>
                </div>
            </div>
  </body>
</html>