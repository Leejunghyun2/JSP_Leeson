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
	String dbNoticeNo_ = request.getParameter("dbNoticeNo");
	
	dbNoticeNo_ = util.getNullBlankCheck(dbNoticeNo_, "0");
	
	int dbNoticeNo = Integer.parseInt(dbNoticeNo_);
	
	SubBoardDAO dao = new SubBoardDAO(); 
	
	int memberNo = sessionNo;
	int noticeNo = 0;
	if(noticeGubun.equals("T")){
		if(dbNoticeNo > 0){
			noticeNo = dbNoticeNo;
		}else{
			noticeNo = dao.getMaxValueNumRefNoNoticeNo("noticeNo") + 1; // noticeGubun 최대값 + 1
		}
	}
	
	String attachInfo = "-"; 
	
	SubBoardDTO arguDto = new SubBoardDTO();
	content = util.getCheckString(content);
	arguDto.setNo(no);
	arguDto.setWriter(writer);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setIp(ip);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setMemberNo(memberNo);
	arguDto.setAttachInfo(attachInfo);
	 
	
	int result = dao.setUpdate(arguDto);
	
 	if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_view&pageNumber=" + pageNumber + "&no="+no+"&searchGubun="+searchGubun+"&searchData="+searchData+"';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_sujung&pageNumber=" + pageNumber + "&no="+no+"&searchGubun="+searchGubun+"&searchData="+searchData+"';");
		out.println("</script>");
	}
	
	
	
%>