<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath(); //프로젝트 이름
	String url = request.getRequestURL().toString(); //도메인이랑 프로젝트 현재파일 경로까지
	String uri = request.getRequestURI().toString(); // 프로젝트이름 부터 현재파일 경로까지
	String[] pgNamet = url.split("/");
	String pgName = pgNamet[pgNamet.length - 2];
	%>
	|
	<a href="<%=path%>">Home</a>
	|
	<%
	if (pgName.equals("member")) {
	%>
	<a href="../member/list.jsp"><font
		style="color: red; font-weight: bolder">회원관리</font></a>
	<%
	} else {
	%>
	|
	<a href="../member/list.jsp">회원관리</a>
	<%
	}
	%>
	<%
	if (pgName.equals("product")) {
	%>
	<a href="../product/list.jsp"><font
		style="color: red; font-weight: bolder">상품관리</font></a>
	<%
	} else {
	%>
	<a href="../product/list.jsp">상품관리</a>
	<%
	}
	%>
	|
	<% if (pgName.equals("useBean")){ %>
	   <a href="../useBean/chuga.jsp"><font style="color: red; font-weight: bold">useBean</font></a>
    <%} else { %>
       <a href="../useBean/chuga.jsp">useBean</a>
	<%} %>
	|
	<a href="../main/main.jsp?menuGubun=member2_list">회원관리2</a>
	|
	<a href="../memberBasic/list.jsp">회원관리(Basic)</a>
	|
	<a href="../book/list.jsp">도서관리</a>
