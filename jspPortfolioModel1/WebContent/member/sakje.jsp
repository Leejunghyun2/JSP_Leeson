<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form name="sakjeForm">
	<input type="hidden" name="no" value=<%=no %>>
	<table border="1" align="center">
		<tr>
			<td>아이디 : </td>
			<td>
			<%=rsDto.getId()%>
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
			<%=rsDto.getName()%>
			
			</td>
		</tr>
		<tr>
			<td>연락처 :</td>
			<td><%=rsDto.getPhone()%></td>
		</tr>
		<tr>
			<td>이메일 :</td>
			<td>
			<%=rsDto.getEmail()%>
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
				<%=rsDto.getJuso1()%>
				<%=rsDto.getJuso2()%>
			 	<%=rsDto.getJuso3()%>
			 	<%=rsDto.getJuso4()%>
			</td>
		</tr>
		<tr>
			<td>회원등급</td>
			<td>
			<%=rsDto.getGrade() %>
			
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="sakje();">삭제하기</button>
				<button type="button" onclick="location.href='main.jsp?menuGubun=member_list';">목록으로</button>
			</td>
		</tr>
	</table>
	</form>
<script>
	function sakje(){
		if(confirm('삭제 하시겠습니까?')){
			var f = document.sakjeForm
			f.action = "mainProc.jsp?menuGubun=member_sakjeProc"
			f.method = "post"
			f.submit();
			
		}
	}

</script>