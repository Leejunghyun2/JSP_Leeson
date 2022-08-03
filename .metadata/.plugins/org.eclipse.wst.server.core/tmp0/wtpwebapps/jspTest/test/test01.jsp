<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01</title>
</head>
<body>
<h2>test01.jsp</h2>
 int a = 100;
 <hr>
 <%
  int a = 100;
  out.println("->" + a + "<br>");
  String name = "홍길동";
  out.println("->" + name);
  out.print("<hr>");
 %>
dd <%= a %>dd
</body>
</html>