<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String age_ = request.getParameter("age");

	JSONObject jsonObj = new JSONObject();
	jsonObj.put("id", id);
	jsonObj.put("passwd", passwd);
	jsonObj.put("name", name);
	jsonObj.put("age", age_);
	
	//String jsonStr = jsonObj.toJSONString();
	
%>
id : <span id="span_id"></span><br>
passwd : <span id="span_passwd"></span><br>
name : <span id="span_name"></span><br>
age : <span id="span_age"></span><br>


<script>
function aaa(value1){
	var json_info = JSON.parse(value1);	
	$("#span_id").text(json_info.id);
	$("#span_passwd").text(json_info.passwd);
	$("#span_name").text(json_info.name);
	$("#span_age").text(json_info.age);
}
aaa('<%=jsonObj%>');
</script>