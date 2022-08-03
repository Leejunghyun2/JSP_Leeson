<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String addr = request.getParameter("address");
  String grade = request.getParameter("grade");
  String[] hobby = request.getParameterValues("hobby");
  
  
  String tmp = "";
  for(int i=0; i<hobby.length; i++){
	  tmp += hobby[i]+",";
  }
    out.print(tmp.substring(0,tmp.length()-1));
%>
   <%=addr%>
   <%=grade%>