<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String e_num_ = request.getParameter("e_num");
	String ename = request.getParameter("e_name");
	String dname = request.getParameter("d_name");
	String salary_ = request.getParameter("salary");
	String mname = request.getParameter("m_name");
	
	
	int e_num = Integer.parseInt(e_num_);
	int salary = Integer.parseInt(salary_);
	
	
	
%>
<h2>5번문제</h2>
<hr>
	<table border="1" width ="30%">
		<tr>
			<th>사원번호</th>
			<td><%=e_num %></td>
		</tr>
		<tr>
			<th>사원명</th>
			<td><%=ename %></td>
		</tr>
		<tr>
			<th>부서명</th>
			<td><%=dname %></td>
		</tr>
		<tr>
			<th>급여</th>
			<td><%=salary %></td>
		</tr>
		<tr>
			<th>부서장명</th>
			<td><%=mname %></td>
		</tr>
	</table>