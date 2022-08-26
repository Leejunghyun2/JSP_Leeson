<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	
	int num = 0;
	String tbl = "-";
	int refNo=0;
	int stepNo = 1;
	int levelNo = 1; 
	int paentNo = 0;
	int hit = 0;
	int memberNo = sessionNo;
	int noticeNo = 0;
	String attachInfo = "-";
	
%>