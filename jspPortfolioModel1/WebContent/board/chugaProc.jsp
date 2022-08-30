<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<%
	String no_ = request.getParameter("no");

	int failCounter = 0;
	if(no_ == null || no_.trim().equals("")){
		failCounter++;	
	}
	int no = Integer.parseInt(no_);
	
	//데이터베이스 들어가기전에 예외처리 다해야함
	String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	
	BoardDAO dao = new BoardDAO();
	
	int num = dao.getMaxNumRefNo("num") + 1;
	String tbl = "-";
	//새글
	int refNo = dao.getMaxNumRefNo("refNo") + 1;
	int stepNo = 1;
	int levelNo = 1;
	int parentNo = 0;
	
	//답변글
	if(no > 0){
		BoardDTO boardDto = new BoardDTO();
		boardDto.setNo(no);
		
		boardDto = dao.getSelectOne(boardDto);
		dao.setUpdateRelevel(boardDto);
		
		refNo = boardDto.getRefNo();
		stepNo = boardDto.getStepNo() + 1;
		levelNo = boardDto.getLevelNo() + 1;
		parentNo = no;
	}
	
	
	int hit = 0;
	
	int memberNo = sessionNo;
	int noticeNo = 0;
	if(noticeGubun.equals("T")){
		noticeNo = dao.getMaxNumRefNo("noticeNo")+1;
	}
	
	String attachInfo = "-";
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNum(num);
	arguDto.setTbl(tbl);
	arguDto.setWriter(writer);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setParentNo(parentNo);
	arguDto.setHit(hit);
	arguDto.setIp(ip);
	arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
    int result = dao.setInsert(arguDto);
    String ment = "";
    String addr = "";
	if(result > 0){
		ment = "";
		addr = "main.jsp?menuGubun=board_list";
	} else {
		ment = "등록 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_chuga";
	}
	out.println("<script>");
	if(result <= 0){
		out.println("alert('"+ ment +"');");
	}
	out.println("location.href = '" + addr + "';");
	out.println("</script>");
	
	
	
%>