<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String no_=request.getParameter("no");   
   int no=Integer.parseInt(no_);
   
   MemberDTO dto=new MemberDTO();
   dto.setNo(no);
   
   
   MemberDAO dao=new MemberDAO();
   MemberDTO rsDto=dao.getSelectOne(dto);
   
   String juso = rsDto.getJuso1() + " ";
   juso += rsDto.getJuso2() + " ";
   juso += rsDto.getJuso3() + " ";
   juso += rsDto.getJuso4();
   if(rsDto.getNo() <= 0){
	   out.println("<script> alert('존재하지 않는 회원입니다.'); location.href='main.jsp?menuGubun=member_list'; </script>");
	   return;
   }
%>    

<h2>회원상세보기</h2>

<table border="1" width="80%" align="center">
   <tr>
      <td>아이디</td>
      <td><%=rsDto.getId() %></td>
   </tr>
   <tr>
      <td>이름</td>
      <td><%=rsDto.getName() %></td>
   </tr>
   <tr>
      <td>연락처</td>
      <td><%=rsDto.getPhone() %></td>
   </tr>
   <tr>
      <td>이메일</td>
      <td><%=rsDto.getEmail() %></td>
   </tr>
   <tr>
      <td>주민번호</td>
      <td><%=rsDto.getJumin().substring(0,8) + "******" %></td>
   </tr>
   <tr>
      <td>주소</td>
      <td><%=juso %></td>
   </tr>
   <tr>
      <td>회원등급</td>
      <td><%=rsDto.getGrade() %></td>
   </tr>
   <tr>
      <td>첨부파일 :</td>
      <td>
      <% 
      if(rsDto.getAttachInfo() == null || rsDto.getAttachInfo().equals("-")){
			out.println(" ");
		}else{
			String[] tmp = rsDto.getAttachInfo().split(",");
			 for(int j=0; j<tmp.length; j++) {
               String[] imsiArray2 = tmp[j].split("[|]");
               
               String imsiImgPath = "";
               imsiImgPath += request.getContextPath();
               imsiImgPath += "/attach";
               imsiImgPath += request.getContextPath();
               imsiImgPath += "/member/";
               imsiImgPath += imsiArray2[1];
               
               
               out.println("<img src='" + imsiImgPath + "' width='50' height='50'>" + imsiArray2[0] + "<br>");
			}
		}
      %>
      </td>
   </tr>
</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%"; align="right">
	   |
	   <a href="#" onclick="move('member_list','')">목록</a>
	   |
	   <a href="#" onclick="move('member_chuga','')">추가</a>
	   |
	   <a href="#" onclick="move('member_sujung','<%=no%>')">수정</a>
	   |
	   <a href="#" onclick="move('member_sakje','<%=no%>')">삭제</a>
	   |
	</div>
<script>
function move(val1, val2){
	location.href = 'main.jsp?menuGubun='+ val1 + "&no=" +val2;
}
</script>