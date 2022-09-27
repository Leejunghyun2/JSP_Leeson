<%@page import="member.model.memberDao.SjDAO"%>
<%@page import="member.model.memberDto.SjDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String sname = request.getParameter("sname");
	String mun_1_ = request.getParameter("mun_1");
	String mun_2_ = request.getParameter("mun_2");
	String mun_3_ = request.getParameter("mun_3");
	String mun_4_ = request.getParameter("mun_4");
	String mun_5_ = request.getParameter("mun_5");
	
	String[] jungdab = {"1","2","3","4","3"};
	int jumsu = 0;
	
	int mun_1 = Integer.parseInt(mun_1_);	
	int mun_2 = Integer.parseInt(mun_2_);	
	int mun_3 = Integer.parseInt(mun_3_);	
	int mun_4 = Integer.parseInt(mun_4_);	
	int mun_5 = Integer.parseInt(mun_5_);
	
	
	String mun_ox_1 = mun_1 +" (X)";
	String mun_ox_2 = mun_2 +" (X)";
	String mun_ox_3 = mun_3 +" (X)";
	String mun_ox_4 = mun_4 +" (X)";
	String mun_ox_5 = mun_5 +" (X)";
	
	if(jungdab[0].equals(mun_1_)){
		mun_ox_1 = mun_1 +" (O)";
		jumsu += 20;
	}
	if(jungdab[1].equals(mun_2_)){
		mun_ox_2 = mun_2 +" (O)";
		jumsu += 20;
	}
	if(jungdab[2].equals(mun_3_)){
		mun_ox_3 = mun_3 +" (O)";
		jumsu += 20;
	}
	if(jungdab[3].equals(mun_4_)){
		mun_ox_4 = mun_4 +" (O)";
		jumsu += 20;
	}
	if(jungdab[4].equals(mun_5_)){
		mun_ox_5 = mun_5 +" (O)";
		jumsu += 20;
	}
	
	out.println(name + "<br>");
	out.println(sname + "<br>");
	out.println(mun_ox_1 + "<br>");
	out.println(mun_ox_2 + "<br>");
	out.println(mun_ox_3 + "<br>");
	out.println(mun_ox_4 + "<br>");
	out.println(mun_ox_5 + "<br>");
	out.println(jumsu + "<br>");
	
	
	SjDTO arguDto = new SjDTO();
	arguDto.setName(name);
	arguDto.setSname(sname);
	arguDto.setMun_1(mun_1);
	arguDto.setMun_2(mun_2);
	arguDto.setMun_3(mun_3);
	arguDto.setMun_4(mun_4);
	arguDto.setMun_5(mun_5);
	arguDto.setMun_ox_1(mun_ox_1);
	arguDto.setMun_ox_2(mun_ox_2);
	arguDto.setMun_ox_3(mun_ox_3);
	arguDto.setMun_ox_4(mun_ox_4);
	arguDto.setMun_ox_5(mun_ox_5);
	arguDto.setJumsu(jumsu);

	SjDAO dao = new SjDAO();
	int result = dao.setInsert(arguDto);

	if(result > 0){
		out.println("<script>");
		out.println("alert('성공');");
		out.println("location.href = 'sjList.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생');");
		out.println("location.href = 'sj.jsp'");
		out.println("</script>");
	}
	
%>