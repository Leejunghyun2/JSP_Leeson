<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../_include/inc_header.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%@ include file = "../../_include/inc_menu.jsp" %>
	name : <input type="text" name="name" id="name"><br>
	kor : <input type="text" name="kor" id="kor"> <br>
	eng : <input type="text" name="eng" id="eng"><br>
	mat : <input type="text" name="mat" id="mat"><br>
	sci : <input type="text" name="sci" id="sci"><br>
	his : <input type="text" name="his" id="his"><br>
	<button type="button" id="btnSave">확인</button>
	
	<hr>
	name : <span id="json_name"></span><br>
	kor : <span id="json_kor"></span> <br>
	eng : <span id="json_eng"></span><br>
	mat : <span id="json_mat"></span><br>
	sci : <span id="json_sci"></span><br>
	his : <span id="json_his"></span><br>
	tot : <span id="json_tot"></span><br>
	avg : <span id="json_avg"></span><br>
	<hr>
	<div id="result"></div>
<script>
$(function(){
	$("#btnSave").click(function(){
		examProc();
	});
});
function examProc(){
	var param = {
			name: $("#name").val(),
			kor: $("#kor").val(),
			eng: $("#eng").val(),
			mat: $("#mat").val(),
			sci: $("#sci").val(),
			his: $("#his").val()
	}
	var url = "jspStudyModel2/exam_servlet/join2Proc.do";
	$.ajax({
		type : "post",
		data : param,
		datatype: "JSON",
		url : url,
		success: function(data){
			var jsonMember = JSON.parse(data);
			$("#result").text(data);
			$("#json_name").text(jsonMember.name);
			$("#json_kor").text(jsonMember.kor);
			$("#json_eng").text(jsonMember.eng);
			$("#json_mat").text(jsonMember.mat);
			$("#json_sci").text(jsonMember.sci);
			$("#json_his").text(jsonMember.his);
			$("#json_tot").text(jsonMember.tot);
			$("#json_avg").text(jsonMember.avg);
			
		}
	});	
}
</script>
</body>
</html>