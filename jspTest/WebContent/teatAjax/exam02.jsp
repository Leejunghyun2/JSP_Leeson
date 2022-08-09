<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<h2>로그인</h2>
이름 : <input type="text" name="name" id="name"><br>
국어 : <input type="text" name="kor" id="kor"><br>
영어 : <input type="text" name="eng" id="eng"><br>
수학 : <input type="text" name="mat" id="mat"><br>
과학 : <input type="text" name="scie" id="scie"><br>
역사 : <input type="text" name="his" id="his"><br>
<button type="button" id="btnSubmit">등록</button><br>
<div id="result" style="border: 0px solid red;"></div>

<div id="displayArea" style="display: none;">
<br>
<hr>
<br>

이름 : <span id="span_name"></span> <br>
국어 : <span id="span_kor"></span> <br>
영어 : <span id="span_eng"></span> <br>
수학 : <span id="span_mat"></span> <br>
과학 : <span id="span_scie"></span> <br>
역사 : <span id="span_his"></span> <br>
총점 : <span id="span_tot"></span> <br>
평균 : <span id="span_avg"></span> <br>
</div>
<script>
	$(function(){
		$("#btnSubmit").click(function(){
			var name = $("#name").val();
			var kor = $("#kor").val();
			var eng = $("#eng").val();
			var mat = $("#mat").val();
			var scie = $("#scie").val();
			var his = $("#his").val();
			
			param = {
					"name": name,
					"kor" : kor,
					"eng" : eng,
					"mat" : mat,
					"scie" : scie,
					"his" : his
					}
			$.ajax({
				type : "post",
				data : param,
				url : "exam02Proc.jsp",
				success : function(data){
					//$("#result").html(data);
					json_info = JSON.parse(data);
					$("#span_name").text(json_info.name);
					$("#span_kor").text(json_info.kor);
					$("#span_eng").text(json_info.eng);
					$("#span_mat").text(json_info.mat);
					$("#span_scie").text(json_info.scie);
					$("#span_his").text(json_info.his);
					$("#span_tot").text(json_info.tot);
					$("#span_avg").text(json_info.avg);
					
					$("#displayArea").show();
				}
			});
			
		});
	});
</script>
</body>
</html>