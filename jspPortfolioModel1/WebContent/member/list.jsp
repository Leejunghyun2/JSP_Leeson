<%@page import="config.Util"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
    
    Util util = new Util();
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}
    MemberDAO dao = new MemberDAO();
    ArrayList<MemberDTO> list = dao.getSelectAll(searchGubun, searchData); 
    int totalCount = list.size();
     
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원목록</h2>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="left">
	<%if(searchGubun.equals("")){ %>
	* 전체목록 (<%=list.size() %>건)
	<%} else { %>
	* 검색어 <%=searchData %> 으/로 검색된 목록 (<%=list.size() %>건)
	<%} %>
</div>
	<table border="1" width="80%">
		<tr>
			<th>순번</th>
			<th>사진</th>
			<th>아이디</th>
			<th>이름</th>
			<th>연락처</th>
			<th>주민번호</th>
			<th>등급</th>
			<th>등록일</th>
		</tr>
		<% 
		for (int i=0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td><%
				if(dto.getAttachInfo() == null ||dto.getAttachInfo().equals("-")){
					out.println(" ");
				}else{
					String[] tmp = dto.getAttachInfo().split(",");
					 for(int j=0; j<tmp.length; j++) {
	                     String[] imsiArray2 = tmp[j].split("[|]");
	                     
	                     String imsiImgPath = "";
	                     imsiImgPath += request.getContextPath();
	                     imsiImgPath += "/attach";
	                     imsiImgPath += request.getContextPath();
	                     imsiImgPath += "/member/";
	                     imsiImgPath += imsiArray2[1];
	                     
	                     
	                     out.println("<img src='" + imsiImgPath + "' width='50' height='50'><br>" + imsiArray2[0] + "<hr>");
					}
				}
				%>
			</td>
			<td><a href="#" onclick="move('member_view','<%=dto.getNo() %>');"><%=dto.getId() %></a></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getJumin() %></td>
			<td><%=dto.getGrade() %></td>
			<td><%=dto.getRegiDate() %></td>
		</tr>
		<%
		} 
		%>
		<tr>
    	<td colspan="8" align="center" style="padding: 20px 0px;">
    	    <form name="searchForm"> 
	    	     <select name="searchGubun" style="text-align: center;">
	    	      <option value="" <% if(searchGubun.equals("")){out.print("selected");}%>>-- 선택 --</option>
	    	      <option value="id" <% if(searchGubun.equals("id")){out.print("selected");}%>>아이디</option>
	    	      <option value="name" <% if(searchGubun.equals("name")){out.print("selected");}%>>이름</option>
	    	      <option value="phone" <% if(searchGubun.equals("phone")){out.print("selected");}%>>연락처</option>
	    	      <option value="jumin" <% if(searchGubun.equals("jumin")){out.print("selected");}%>>주민번호</option>
	    	      <option value="id_name_phone_jumin" <% if(searchGubun.equals("id_name_phone_jumin")){out.print("selected");}%>>아이디+이름+연락처+주민</option>
	    	     </select>
	    	     &nbsp;
	    	     <input type="text" name="searchData" value="<%=searchData%>">
	    	     &nbsp;
    	     <button type="button" onclick="search();">검색하기</button>
    	     </form>
    	</td>
    </tr>
	</table>
	<div style="border: 0px solid red; padding-top: 20px; width: 80%"; align="right">
		|
		<a href="#" onclick="move('member_list','');">목록</a>
		|
		<a href="#" onclick="move('member_chuga','');">등록</a>
		|
		<a href="#" onclick="move('member_attachChuga','');">등록(attach)</a>
		|
	</div>
<script>
function move(val1, val2){
	location.href = 'main.jsp?menuGubun='+ val1 + "&no=" +val2;
}
function search(){
	var f = document.searchForm
	f.action = "mainProc.jsp?menuGubun=member_listSearch";
	f.method = "post";
	f.submit();
}
</script>
</body>
</html>