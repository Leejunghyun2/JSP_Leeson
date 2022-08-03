<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");

%>
ddd
<form name = "examForm05">
     <input type="hidden" name="name" value=<%=name %>>
     <input type="hidden" name="age" value=<%=age %>>
     <input type="hidden" name="gender" value=<%=gender %>>
</form>

<script>
function move(){
	document.examForm05.action = "exam05Result.jsp";
	document.examForm05.method = "post";
	document.examForm05.submit();
	
	
}
move();
</script>