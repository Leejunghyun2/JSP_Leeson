<%@page import="subBoard.model.dto.SubBoardChkDTO"%>
<%@page import="subBoard.model.dao.SubBoardChkDAO"%>
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
	
	String tbl = request.getParameter("tbl");
	tbl = util.getNullBlankCheck(tbl, "freeboard");
	
	String imsiBoardTitle = "";
	
	SubBoardChkDAO SubBoardChkdao = new SubBoardChkDAO(); 
	SubBoardChkDTO returnTblDto = SubBoardChkdao.getselectOne(tbl);
	
	int a = 0;
	if(a == 0){
		out.println("returnTblDto : "+returnTblDto.getBoardChkNo() + "<br>");
		out.println("returnTblName : "+returnTblDto.getTblName() + "<br>");
	}
	
	if(returnTblDto.getBoardChkNo() > 0){
		imsiBoardTitle = returnTblDto.getTblName();
	}else{
		out.println("<script>");
		out.println("alert('잘못된 경로입니다.')");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_list&tbl=freeboard';");
		out.println("</script>");
	}
	out.println("tbl : " +tbl + "<hr>");
	
	String no_ = request.getParameter("no");
	no_ = util.getNullBlankCheck(no_, "0");
	int no = Integer.parseInt(no_);
	
	String pageNumber_ = request.getParameter("pageNumber");
	pageNumber_ = util.getNullBlankCheck(pageNumber_, "1");
	int pageNumber = Integer.parseInt(pageNumber_);
	
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	int searchCheckCounter = 0;
	
	if(searchGubun == null || searchGubun.trim().equals("")){
		searchGubun ="";
		searchCheckCounter++;
	}
	if(searchData == null || searchData.trim().equals("")){
		searchData ="";
		searchCheckCounter++;
	}
	if(searchCheckCounter > 0){
		searchData ="";
		searchGubun ="";
	}
	String imsiQueryString = "searchGubun="+searchGubun + "&searchData="+searchData + "&tbl=" + tbl;
%>
검색 :<%=pageNumber %>  / <%=searchGubun%> / <%=searchData%> / <%=referer %> :::: <%=url %>
<hr>