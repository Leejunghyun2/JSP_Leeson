<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String menuGubun = request.getParameter("menuGubun");
	String includePage = "";
	if(menuGubun.equals("member2_chugaProc")){
		includePage = "../member2/chugaProc.jsp";
	}
	
%>
	<jsp:include page="<%=includePage %>"  flush="true"></jsp:include>