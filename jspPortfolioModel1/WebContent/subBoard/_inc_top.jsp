<%@page import="java.util.ArrayList"%>
<%@page import="subBoard.model.dao.SubBoardDAO"%>
<%@page import="subBoard.model.dto.SubBoardDTO"%>
<%@page import="config.Util"%>
<%@ include file="../_include/inc_header.jsp"%>
<%@ include file="../_include/inc_sessionChk.jsp"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	Util util = new Util();
	
%>