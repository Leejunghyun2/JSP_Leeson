<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	
	String passwd = request.getParameter("passwd");

	String dbNoticeNo_ = request.getParameter("dbNoticeNo");
	
	dbNoticeNo_ = util.getNullBlankCheck(dbNoticeNo_, "0");
	
	int dbNoticeNo = Integer.parseInt(dbNoticeNo_);
	
	SubBoardDAO dao = new SubBoardDAO(); 
	
	
	String attachInfo = "-"; 
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	 
	
	int result = dao.setDelete(arguDto);
	
 	if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_list&searchGubun="+searchGubun+"&searchData="+searchData+"';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_sakje&pageNumber="+pageNumber+"&no="+no+"&searchGubun="+searchGubun+"&searchData="+searchData+"';");
		out.println("</script>");
	}
	
	
	
%>