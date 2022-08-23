<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../_include/inc_sessionChk.jsp" %> 
<div style="border: 0px solid red; width: 60%;">
    히어 위 고
<% if(sessionNo <= 0) { %>
</div>
	<div style="padding: 20px 0px;">
		<form name="loginForm">
		 아이디 : <input type="text" name="id" style="width: 80px;">
		 비밀번호 : <input type="password" name="passwd" style="width: 80px;">
		 <button type="button" onclick="login();">로그인</button>
		</form>
	</div> 
<%} %> 
	<script>
	 function login(){
		 if(confirm('로그인할까요?')){
			 var f = document.loginForm;
			 f.action = "mainProc.jsp?menuGubun=noLogin_loginProc";
			 f.method = 'post';
			 f.submit();
		 }
	 }
	</script>