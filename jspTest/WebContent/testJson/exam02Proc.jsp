<%@page import="java.io.PrintWriter"%>
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
	
	out.println(jsonObj);
	//String jsonStr = jsonObj.toJSONString();
	
	//PrintWriter pw = response.getWriter();
	//pw.print(jsonStr);
	//pw.flush();
	//pw.close();
	
%>
