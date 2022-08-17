<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hakbun_ = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String parentPhone = request.getParameter("parentPhone");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr3 = request.getParameter("addr3");
	String addr4 = request.getParameter("addr4");
	int hakbun = Integer.parseInt(hakbun_);
	
	
	if(addr3 == null || addr3.equals("")){ 
		addr3 = " ";
	}
	if(addr4 == null || addr4.equals("")){
		addr4 = " ";
	}
	
	HaksaMemberDTO dto = new HaksaMemberDTO();
	dto.setHakbun(hakbun);
	dto.setPhone(phone);
	dto.setParentPhone(parentPhone);
	dto.setAddr1(addr1);
	dto.setAddr2(addr2);
	dto.setAddr3(addr3);
	dto.setAddr4(addr4);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setUpdate(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('수정처리중 오류가 발생 하였습니다.');");
		System.out.println("location.href= 'sujung.jsp?hakbun="+hakbun+"';");
		out.println("</script>");
	}

%>