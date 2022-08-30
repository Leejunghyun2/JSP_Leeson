<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp"%>
<%
	
	String passwd = request.getParameter("passwd");
	String no_ = request.getParameter("no");
	if(no_ == null || no_.trim().equals("")){
		no_ = "0";
	}
	int no = Integer.parseInt(no_);
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);
	
		BoardDAO dao = new BoardDAO();
	BoardDTO resultDto = dao.getSelectOne(arguDto);

	Util util = new Util();
	int failCounter = 0;
	
	passwd = util.getNullBlankCheck(passwd, "");
	passwd = util.getCheckString(passwd);
	
	System.out.println(no + " / " + resultDto.getPasswd());
	
	if(passwd.length() <= 0){ failCounter++; System.out.println("0"); }
	
	if(!(resultDto.getPasswd().equals(passwd))){ failCounter++; System.out.println("1");}
	
	if(failCounter>0){
		out.println("<script>");
		out.println("alert('값이 정확하지않습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=board_list';");
		out.println("</script>");
		return;
	}
	


	
	BoardDTO dto = new BoardDTO();
	dto.setNo(no);
	dto.setPasswd(passwd);
	BoardDAO sakjeDao = new BoardDAO();
	
    int result = sakjeDao.setDelete(dto);
    String ment = ""; 
    String addr = "";
	if(result > 0){
		ment = "";
		addr = "main.jsp?menuGubun=board_list";
	} else {
		ment = "삭제 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_sakje&no="+no+"";
	}
	out.println("<script>");
	if(result <= 0){
		out.println("alert('"+ ment +"');");
	}
	out.println("location.href = '" + addr + "';");
	out.println("</script>");
%>
