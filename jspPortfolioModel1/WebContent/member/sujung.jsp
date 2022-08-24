<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>
 <%
   String no_=request.getParameter("no");   
   int no=Integer.parseInt(no_);
   
   MemberDTO dto=new MemberDTO();
   dto.setNo(no);
   
   
   MemberDAO dao=new MemberDAO();
   MemberDTO rsDto=dao.getSelectOne(dto);
   
   if(rsDto.getNo() <= 0){
	   out.println("<script> alert('존재하지 않는 회원입니다.'); location.href='main.jsp?menuGubun=member_list'; </script>");
	   return;
   }
	
%>      
<h2>회원수정</h2>
	<form name="sujungForm">
	<input type="hidden" name="no" value=<%=no %>>
	<table border="1" align="center">
		<tr>
			<td>아이디 : </td>
			<td>
			<%=rsDto.getId()%>
			<input type="hidden" name="id" value="<%=rsDto.getId()%>">
			</td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>이름 :</td>
			<td>
			<%=rsDto.getName()%>
			<input type="hidden" name="name" value="<%=rsDto.getName()%>">
			
			</td>
		</tr>
		<tr>
			<td>연락처 :</td>
			<td><input type="text" name="phone" value="<%=rsDto.getPhone()%>"></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td>
			<input type="text" name="email" value="<%=rsDto.getEmail()%>">
			</td>
		</tr>
		
		<tr>
			<td>주민번호 :</td>
			<td>
			<%=rsDto.getJumin() %>
			</td>
		</tr>
		<tr>
			<td>주소 :</td>
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="juso1" value="<%=rsDto.getJuso1()%>" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" ><br>
			 	<input type="text" id="sample6_address" placeholder="주소" name="juso2" value="<%=rsDto.getJuso2()%>" readonly>
			 	<input type="text" id="sample6_detailAddress" placeholder="상세주소"  value="<%=rsDto.getJuso3()%>" name="juso3"><br>
			 	<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="juso4" value="<%=rsDto.getJuso4()%>" readonly>
			</td>
		</tr>
		<tr>
			<td>회원등급</td>
			<td>
			<%if(rsDto.getGrade().equals("최우수회원")){ %>
				<input type="radio" name="grade" value="최우수회원" checked>최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원">우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원" >일반회원 &nbsp;
			<%}else if(rsDto.getGrade().equals("우수회원")){ %>
				<input type="radio" name="grade" value="최우수회원">최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원" checked>우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원" >일반회원 &nbsp;
			<%}else if(rsDto.getGrade().equals("일반회원")){ %>
				<input type="radio" name="grade" value="최우수회원">최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원">우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원" checked>일반회원 &nbsp;
			<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sujung();">수정하기</button>
				<button type="button" onclick="location.href='main.jsp?menuGubun=member_list';">목록으로</button>
			</td>
		</tr>
	</table>
	</form>
<script>
	function sujung(){
		if(confirm('수정 하시겠습니까?')){
			var f = document.sujungForm
			f.action = "mainProc.jsp?menuGubun=member_sujungProc"
			f.method = "post"
			f.submit();
			
		}
	}

</script>
<jsp:include page="_inc_daumApi.jsp" flush="true"></jsp:include>