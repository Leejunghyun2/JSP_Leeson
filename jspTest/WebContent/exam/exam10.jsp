<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
     request.setCharacterEncoding("UTF-8");
     String a_ = request.getParameter("gugu");
     int a = 0;
     if(a_ == null){
         out.print(a_);
     } else{
    	 a = Integer.parseInt(a_);
     }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{
 display: flex;
 flex-direction : row;
 }
</style>
</head>
<body>
  <!-- 시작할 단수 입력받아 -->
    <form name="gugudan">

시작할 단수 입력 :<input type="text" name="gugu">
  	<button type="button" onclick="guguo();">시작</button>
    
  	</form>
  	<hr>	
  	<div id="container">
	<%if(a!=0){ %>
	<% for(int i=a;i<10;i++){ %>
	<table border="1">
			<% for(int j=1;j<10;j++) {%>
	   			<tr>
	   			   <td><%=i %></td>
	   			   <td>*</td>
	   			   <td><%=j %></td>
	   			   <td>=</td>
	   			   <td><%=i*j %></td>
	   			</tr>
	   		<% } %>
	</table>
	<hr>
	<% 
	} 
	%>
	<% } %>
   </div>
	<script>
		 
		 
	 function guguo(){
		 var f = document.gugudan;
 			f.action = "exam10.jsp";
 			f.method = "post";
 			f.submit();
 			
	 }
	
	</script>
</body>
</html>