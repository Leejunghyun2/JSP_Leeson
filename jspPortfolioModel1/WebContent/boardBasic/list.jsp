<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="config.Util"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@ include file="_inc_top.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>
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
    BoardBasicDAO dao = new BoardBasicDAO();
    ArrayList<BoardBasicDTO> list = dao.getSelectAll();  
    int totalCount = list.size();
    
    %>
<h2>방명록목록</h2>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="left">
	<%if(searchGubun.equals("")){ %>
	* 전체목록 (<%=list.size() %>건)
	<%} else { %>
	* 검색어 <%=searchData %> 으/로 검색된 목록 (<%=list.size() %>건)
	<%} %>
</div>



<table border="1" align="center" width="80%">
	<tr>
		<th width="200px">제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		<th>실작성자</th>
		<td>ip</td>
	</tr>
	<% 
		for(int i=0; i<list.size();i++){
			BoardBasicDTO dto = list.get(i);
			String space = "";
			for(int j=1; j<dto.getStepNo();j++){
				space += "&nbsp;&nbsp;&nbsp;";
			}
		%>
	<tr>
		<% String subject = dto.getSubject();
		if(dto.getSubject().length()>5){
			subject = dto.getSubject().substring(0,5)+"..";
		}
		%>
		
		<td><%=space %><%if(dto.getStepNo() > 1){out.print("└[RE] : ");} %><a href="#" onclick="move('boardBasic_view','<%=dto.getNo()%>','<%=dto.getHit() %>');"><%=subject %></a></td>
		<td><%=dto.getWriter() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td><%=dto.getHit() %></td>
		<td><%if(dto.getMemberNo()>0){
				out.println("회원["+dto.getMemberNo()+"]");
			}else {
				out.println("비회원["+dto.getMemberNo()+"]");
			}
			%></td>
		<td><%=dto.getIp() %></td>
	</tr>
    <%} %>
    
    <tr>
    	<td colspan="5" align="center" style="padding: 20px 0px;">
    	    <form name="searchForm"> 
	    	     <select name="searchGubun">
	    	      <option value="" <% if(searchGubun.equals("")){out.print("selected");}%>>-- 선택 --</option>
	    	      <option value="name" <% if(searchGubun.equals("name")){out.print("selected");}%>>이름</option>
	    	      <option value="content" <% if(searchGubun.equals("content")){out.print("selected");}%>>내용</option>
	    	      <option value="name_content" <% if(searchGubun.equals("name_content")){out.print("selected");}%>>이름+내용</option>
	    	     </select>
	    	     &nbsp;
	    	     <input type="text" name="searchData" value="<%=searchData%>">
	    	     &nbsp;
    	     <button type="button" onclick="search();">검색하기</button>
    	     </form>
    	</td>
    </tr>
</table>

	<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('boardBasic_list','');">목록</a>
		|
		<a href="#" onclick="move('boardBasic_chuga','');">등록</a>
		|
	</div>
	<script>
		function move(val1, val2, val3){
			
			location.href = "main.jsp?menuGubun="+val1+"&no="+val2+"&hit="+val3;
		}
		function search(){
			var f = document.searchForm
			f.action = "mainProc.jsp?menuGubun=boardBasic_listSearch";
			f.method = "post";
			f.submit();
		}
	</script>