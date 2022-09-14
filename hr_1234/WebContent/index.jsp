<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String imsipage = request.getParameter("menuGubun");
	if(imsipage == null || imsipage.equals("")){
		imsipage = "member_list";		
	}
	String pages = imsipage.replace("_", "/") + ".jsp";
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#container{
	display : grid;
	height:98vh;
	grid-template-rows: 100px 50px 1fr 100px;
	grid-template-areas:
	"header"
	"menu"
	"main"
	"footer";
}
#header{
	text-align: center;
	background-color: blue;
	line-height: 100px;
	color: white;
	
}
a{
	margin : 0px 20px;
	text-decoration: none;
	color : white;
}
#menu{
	grid-area : menu;
	background-color: maroon;
	line-height: 50px;
}
#main{
	height : calc(100vh - 250px);
  	grid-area : main;
	background-color: lightgray;
}
#footer{
	text-align: center;
	grid-area : footer;
	background-color: blue;
	line-height: 100px;
	color: white;
	
}

</style>
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<%=path %><%=pages %>
		</div>
		<div id="menu">
		   <a href="index.jsp?menuGubun=member_chuga">회원등록</a>
		   <a href="index.jsp?menuGubun=member_list">회원목록조회/수정</a>
		   <a href="#">회원매출조회</a>
		   <a href="<%=path%>">홈으로.</a>
		</div>
		<div id="main">
		    <jsp:include page="<%=pages %>" flush="true"></jsp:include>
		</div>
		<div id="footer">푸터</div>
	</div>
</body>
</html>