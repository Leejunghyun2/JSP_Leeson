<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart); //로딩이 끝나면 함수 호출

      function drawChart() {
        var url = "${path }/chart_servlet/chart_dbChartProc";
        var jsonData = $.ajax({
        	url : url,
        	dataType : "json",
        	async : false
        }).responseText;
        console.log(jsonData);
        var data = new google.visualization.DataTable(jsonData);
        
        var options = {
          title: 'ttt',
          curveType : ''
        };
        
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <div id="piechart" style="width: 900px; height: 500px;"></div>