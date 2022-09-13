<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%  
	String procGubun = request.getParameter("procGubun");
	String boardChkNo_ = request.getParameter("boardChkNo");
	String tbl = request.getParameter("tbl");
	String tblName = request.getParameter("tblName");
	
	int errorCounter = 0; 
	
	if(tbl == null || tbl.trim().equals("")){
		errorCounter++;
	}
	if(tblName == null || tblName.trim().equals("")){
		errorCounter++;
	}
	
	//중복체크해서 확인하는 메소드 만들어야 함
	
	if(errorCounter > 0){
		return;
	}
	
	boardChkNo_ = util.getNullBlankCheck(boardChkNo_, "0");
	int boardChkNo = Integer.parseInt(boardChkNo_);
	out.println(procGubun);
	out.println(boardChkNo_);
	out.println(tbl);
	out.println(tblName);

	
	SubBoardChkDTO arguDto = new SubBoardChkDTO();
	arguDto.setBoardChkNo(boardChkNo);
	arguDto.setTbl(tbl);
	arguDto.setTblName(tblName);
	
	SubBoardChkDAO dao = new SubBoardChkDAO();
	int result = 0;
	if(procGubun.equals("chugaProc")){
		result = dao.setInsert(arguDto);
	} else if(procGubun.equals("sujungProc")){
		result = dao.setUpdate(arguDto);
	} else if(procGubun.equals("sakjeProc")){
		result = dao.setDelete(arguDto);
	} else{
		return;
	}
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('성공..');");
		out.println("location.href = 'main.jsp?menuGubun=subBoardChk_list'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('성공..');");
		out.println("location.href = 'main.jsp?menuGubun=subBoardChk_list'");
		out.println("</script>");
	}
	
%>