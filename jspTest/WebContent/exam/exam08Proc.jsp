<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%

  String hobby1 = request.getParameter("hobby1");
  String hobby2 = request.getParameter("hobby2");
  String hobby3 = request.getParameter("hobby3");
  String hobby4 = request.getParameter("hobby4");
  String hobby5 = request.getParameter("hobby5");
  String hobby6 = request.getParameter("hobby6");
  String hobby7 = request.getParameter("hobby7");
  String hobby8 = request.getParameter("hobby8");
  
  
  String tmp = hobby1+","+hobby2+","+hobby3+","+hobby4+","+hobby5+","+hobby6+","+hobby7+","+hobby8;
  
  //null처리를 앞에 해줘야함 값이 null일때 ||로 공백 처리먼저하면 오류남
	
  
    out.print(tmp);
%>
 