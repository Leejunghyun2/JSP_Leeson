<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	String post_1 = request.getParameter("post_1");
	String post_2 = request.getParameter("post_2");
	String post_3 = request.getParameter("post_3");
	String post_4 = request.getParameter("post_4");
	
	out.println("id : " + id + "<br>");
	out.println("passwd : " + passwd + "<br>");
	out.println("name : " + name + "<br>");

	out.println("post1 : " + post_1 + "<br>");
	out.println("post2 : " + post_2 + "<br>");
	out.println("post3 : " + post_3 + "<br>");
	out.println("post4 : " + post_4 + "<br>");
	
	String postValue = post_1 + " " + post_2 + " " + post_3 + " " + post_4;
	out.println("postValue : " + postValue);
%>