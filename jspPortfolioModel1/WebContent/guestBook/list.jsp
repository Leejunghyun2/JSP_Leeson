<%@page import="config.Util"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
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
    GuestBookDAO dao = new GuestBookDAO();
    ArrayList<GuestBookDTO> list = dao.getSelectAll(searchGubun, searchData); 
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
		<th>순번</th>
		<th>작성자</th>
		<th width="300px">메모내용</th>
		<th>등록일</th>
		<th>실작성자</th>
	</tr>
	<% 
		for(int i=0; i<list.size();i++){
			GuestBookDTO dto = list.get(i);
		%>
	<tr>
		<td><%=totalCount-- %></td>
		<td><a href="#" onclick="move('guestBook_view','<%=dto.getNo()%>');"><%=dto.getName() %></a></td>
		<td width="300px"><%=dto.getContent() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td><%=dto.getMemberNo() %></td>
	</tr>
    <%} %>
    
    <tr>
    	<td colspan="4" align="center" style="padding: 20px 0px;">
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
		<a href="#" onclick="move('guestBook_list','');">목록</a>
		|
		<a href="#" onclick="move('guestBook_chuga','');">등록</a>
		|
	</div>
	<script>
		function move(val1, val2){
			location.href = "main.jsp?menuGubun="+val1+"&no="+val2;
		}
		function search(){
			var f = document.searchForm
			f.action = "mainProc.jsp?menuGubun=guestBook_listSearch";
			f.method = "post";
			f.submit();
		}
	</script>