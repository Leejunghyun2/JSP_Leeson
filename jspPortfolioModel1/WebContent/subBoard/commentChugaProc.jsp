<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="subBoard.model.dao.SubBoardDAO" %>
<%@ page import="subBoard.model.dto.BoardCommentDTO" %>

<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "../_include/inc_sessionChk.jsp" %>

<%
	String procGubun = request.getParameter("procGubun");
	
	Util util = new Util();

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String commentNo_ = request.getParameter("commentNo");
	commentNo_ = util.getNullBlankCheck(commentNo_, "0");
	int commentNo = Integer.parseInt(commentNo_);
	
	
	String writer = request.getParameter("writer");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	int memberNo = sessionNo;
	//String ip = "";

	BoardCommentDTO BoardCommentDTO = new BoardCommentDTO();
	BoardCommentDTO.setCommentNo(commentNo);
	BoardCommentDTO.setBoardNo(no);
	BoardCommentDTO.setWriter(writer);
	BoardCommentDTO.setPasswd(passwd);
	BoardCommentDTO.setContent(content);
	BoardCommentDTO.setMemberNo(memberNo);
	BoardCommentDTO.setIp(ip);
	
	SubBoardDAO subBoardDao = new SubBoardDAO(); 
	int result = 0; 
	if (procGubun.equals("chugaProc")) {
		result = subBoardDao.setCommentInsert(BoardCommentDTO);
	} else if (procGubun.equals("sujungProc")) {
		result = subBoardDao.setCommentUpdate(BoardCommentDTO);
	} else if (procGubun.equals("sakjeProc")) { 
		result = subBoardDao.setCommentDelete(BoardCommentDTO);
	}
	out.println(result);
%>