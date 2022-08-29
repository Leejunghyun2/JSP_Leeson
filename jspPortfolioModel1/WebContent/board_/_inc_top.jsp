<%@page import="board.model.dao.BoardDAO"%>
<%@page import="board.model.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="config.Util"%>
<%@ include file="../_include/inc_header.jsp"%>
<%@ include file="../_include/inc_sessionChk.jsp"%>
<%

request.setCharacterEncoding("UTF-8");

BoardDTO resultDto = null;
BoardDAO dao = null;
String no_ = "";
int no = 0;
if (fileName.equals("chugaProc") || fileName.equals("view") || fileName.equals("sujung") || fileName.equals("sakje") || fileName.equals("sujungProc")
		|| fileName.equals("sakjeProc") || fileName.equals("chuga")) {
	no_ = request.getParameter("no");
	if(no_ == null || no_.trim().equals("")){
		no_ = "0";
	}
	no = Integer.parseInt(no_);

	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);

	dao = new BoardDAO();
	if(fileName.equals("view")){
		dao.setUpdateHit(arguDto);
	}
	resultDto = dao.getSelectOne(arguDto);
	
	
	
}
%>