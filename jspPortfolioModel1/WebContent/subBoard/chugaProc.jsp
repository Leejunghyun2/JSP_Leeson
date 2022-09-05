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
		
	SubBoardDAO dao = new SubBoardDAO(); 
	int num = dao.getMaxValueNumRefNoNoticeNo("num") + 1; //num필드의 최대값 + 1
	String tbl = "-";
	
	//새글
	int refNo = dao.getMaxValueNumRefNoNoticeNo("refNo") + 1; //refNo 필드의 최대값 + 1
	int stepNo = 1; //초기값 1
	int levelNo = 1; //초기값 1
	int parentNo = 0; //초기값 0
	int hit = 0;
	
	int memberNo = sessionNo;
	int noticeNo = 0; 
	if(noticeGubun.equals("T")){
		noticeNo = dao.getMaxValueNumRefNoNoticeNo("noticeNo") + 1; // noticeGubun 최대값 + 1
	}
	
	String attachInfo = "-"; 
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNum(num);
	arguDto.setTbl(tbl);
	arguDto.setWriter(writer);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setParentNo(parentNo);
	arguDto.setHit(hit);
	arguDto.setIp(ip);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setMemberNo(memberNo);
	arguDto.setAttachInfo(attachInfo);
	
	util.getCheckString(content);
	
	int result = dao.setInsert(arguDto);
	
 	if(result > 0){
		out.println("<script>");
		//out.println("");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=subBoard_chuga';");
		out.println("</script>");
	}
	
	
	
%>