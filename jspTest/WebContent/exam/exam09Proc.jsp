<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% String[] name = request.getParameterValues("name");
	String tmp = "";
	for(int i=0; i < name.length; i++){
		if(!name[i].equals(""))
		tmp += name[i] + ",";
	}
   out.print(tmp.substring(0,tmp.length()-1));

%>