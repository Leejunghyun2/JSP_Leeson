<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="_inc_top.jsp"%>
<%
  String chartTitle = "장바구니상품별 금액합계";
  String chartType = "PieChart";//PieChart, LineChart, ColumnChart
  String chartCurveType = "";
%>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart); //로딩이 끝나면 함수 호출

      function drawChart() {
        var url = "mainProc.jsp?menuGubun=chart_dbChartProc";
        var jsonData = $.ajax({
        	url : url,
        	dataType : "json",
        	async : false
        }).responseText;
        console.log(jsonData);
        var data = new google.visualization.DataTable(jsonData);
        
        var options = {
          title: '<%=chartTitle%>',
          curveType : '<%=chartCurveType%>'
        };
        
        var chart = new google.visualization.<%=chartType%>(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
    