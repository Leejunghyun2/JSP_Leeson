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

	String no_ = request.getParameter("no");
	no_ = util.getNullBlankCheck(no_, "0");

	int no = Integer.parseInt(no_);
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	int imsiCounter = 0;
	
	if(searchGubun == null || searchGubun.trim().equals("")){
		searchGubun ="";
		imsiCounter++;
	}
	if(searchData == null || searchData.trim().equals("")){
		searchData ="";
		imsiCounter++;
	}
	if(imsiCounter > 0){
		searchData ="";
		searchGubun ="";
	}
%>
검색 : <%=searchGubun%> / <%=searchData%>
<hr>