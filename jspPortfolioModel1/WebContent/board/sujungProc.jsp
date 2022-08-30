<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>    
<%
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeNo_ = request.getParameter("noticeNo");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");	
	
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

	 
	email = util.getNullBlankCheck(email, "");
	email = util.getCheckString(email);
	if(email.length() <= 0){ failCounter++; }
	
	passwd = util.getNullBlankCheck(passwd, "");
	passwd = util.getCheckString(passwd);
	if(passwd.length() <= 0){ failCounter++; }
	
	subject = util.getNullBlankCheck(subject, "");
	subject = util.getCheckString(subject);
	if(subject.length() <= 0){ failCounter++; }
	
	content = util.getNullBlankCheck(content, "");
	content = util.getCheckString(content);
	if(content.length() <= 0){ failCounter++; }
	
	
	noticeNo_ = util.getNullBlankCheck(noticeNo_, "");
	//if(noticeNo_.equals("")){ failCounter++; }
	int boxNoticeNo = Integer.parseInt(noticeNo_);
	
	
	noticeGubun = util.getNullBlankCheck(noticeGubun, "");
	if(!(noticeGubun.equals("T") || noticeGubun.equals("F"))){ failCounter++; }
	
	secretGubun = util.getNullBlankCheck(secretGubun, "");
	if(!(secretGubun.equals("T") || secretGubun.equals("F"))){ failCounter++; }
	
	if(secretGubun.equals("T") && noticeGubun.equals("T")) { failCounter++; }
		
	if(passwd.equals(resultDto.getPasswd())){ failCounter++; }
		
	if(failCounter>0){
		out.println("<script>");
		out.println("alert('값이 정확하지않습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=board_list';");
		out.println("</script>");
		return;
	}
	
	
	int noticeNo = 0;
	if(noticeGubun.equals("T")){
		if(boxNoticeNo > 0){
			 noticeNo = resultDto.getNoticeNo();
		} else {
			noticeNo = dao.getMaxNumRefNo("noticeNo") + 1; //기존에 공지글이 아닐때에서 공지글로
		}
	}
	
	int memberNo = sessionNo;
	BoardDTO dto = new BoardDTO();
	dto.setNo(no);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setEmail(email);
	dto.setPasswd(passwd);
	dto.setMemberNo(memberNo);
	dto.setNoticeNo(noticeNo);
	dto.setSecretGubun(secretGubun);
	dto.setAttachInfo(resultDto.getAttachInfo());
	BoardDAO sujungDao = new BoardDAO();
	
    int result = sujungDao.setUpdate(dto);
    String ment = "";
    String addr = "";
	if(result > 0){
		ment = "";
		addr = "main.jsp?menuGubun=board_list";
	} else {
		ment = "수정 처리 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_sujung&no="+no+"";
	}
	out.println("<script>");
	if(result <= 0){
		out.println("alert('"+ ment +"');");
	}
	out.println("location.href = '" + addr + "';");
	out.println("</script>");
%>
