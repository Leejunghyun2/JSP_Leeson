<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>디렉토리 목록</h2>
<%
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile";
	
	String directory = uploadPath;
	String[] files = new File(directory).list();
	
	int num = 1;
	for (String file : files){
		%>
     
	 <a href='#' onclick='move("<%=file%>");'> <%=file %></a><br>
	 <%
	    
	}
%>
	<form name="deleteProc">
	 <input type="hidden"  name="fileName">
	 </form>
<script>
function move(value1){
  	var f = document.deleteProc;
  	f.fileName.value = value1;
  	f.action = "aaa.jsp";
  	f.method = "post";
  	f.submit();
  
  
  
}

</script>
</body>
</html>