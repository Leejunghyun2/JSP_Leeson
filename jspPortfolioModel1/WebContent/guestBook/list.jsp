<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    GuestBookDAO dao = new GuestBookDAO();
    ArrayList<GuestBookDTO> list = dao.getSelectAll(); 
    System.out.println(list.size());
    %>
<h2>방명록내용</h2>
<table border="1" align="center" width="80%">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th width="300px">메모내용</th>
		<th>등록일</th>
		
	</tr>

</table>