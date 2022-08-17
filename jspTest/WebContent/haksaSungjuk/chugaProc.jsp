<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	String hakbun_ = request.getParameter("hakbun");
	String sihumNo_ = request.getParameter("sihumNo");
	
	int kor = Integer.parseInt(kor_);	
	int eng = Integer.parseInt(eng_);	
	int mat = Integer.parseInt(mat_);	
	int sci = Integer.parseInt(sci_);	
	int his = Integer.parseInt(kor_);	
	int hakbun = Integer.parseInt(hakbun_);	
	int sihumNo = Integer.parseInt(sihumNo_);
	int tot = kor + eng + mat + sci + his;
	double avg = tot / 5.0;
	String grade = "가";
	if(avg >= 90){
		grade = "수";
	}else if(avg >= 80){
		grade = "우";
	}else if(avg >= 70){
		grade = "미";
	}else if(avg >= 60){
		grade = "양";
	} 


	
	HaksaSungjukDTO dto = new HaksaSungjukDTO();
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setSci(sci);
	dto.setHis(his);
	dto.setTot(tot);
	dto.setAvg(avg);
	dto.setGrade(grade);
	dto.setHakbun(hakbun);
	dto.setSihumNo(sihumNo);
	
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	int result = dao.setInsert(dto);
	
	if (result > 0){
		out.println("<script>");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('추가처리중 오류가 발생 하였습니다.');");
		System.out.println("location.href = 'chuga.jsp';");
		out.println("</script>");
	}
	
%>