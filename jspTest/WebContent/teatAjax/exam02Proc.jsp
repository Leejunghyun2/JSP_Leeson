<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>
     
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	String scie = request.getParameter("scie");
	String his = request.getParameter("his");
	int tot = Integer.parseInt(kor) + Integer.parseInt(eng) +Integer.parseInt(mat) +Integer.parseInt(scie) +Integer.parseInt(his);
	double avg = tot/5.0;
	

	JSONObject jsonObj = new JSONObject();
	jsonObj.put("name", name);
	jsonObj.put("kor", kor);
	jsonObj.put("eng", eng);
	jsonObj.put("mat", mat);
	jsonObj.put("scie", scie);
	jsonObj.put("his", his);
	jsonObj.put("tot", tot);
	jsonObj.put("avg", avg);
	out.println(jsonObj);
%>
