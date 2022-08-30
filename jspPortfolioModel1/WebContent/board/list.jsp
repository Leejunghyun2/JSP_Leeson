<%@page import="config.Util"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_top.jsp" %>
<% 
	Util util = new Util();
	String pageNumber_ = request.getParameter("pageNumber");
    pageNumber_ = util.getNullBlankCheck(pageNumber_, "1");
	int pageNumber = Integer.parseInt(pageNumber_);
    
    
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
    
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}
	
 	BoardDAO dao = new BoardDAO(); 
 	
 	int totalRecord = dao.getTotalRecord(searchGubun, searchData); 
 	int pageSize = 10;
 	int blockSize = 10;
 	
 	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
 	int totalPage = (int)totalPageDou;
 	
 	int startRecord = pageSize * (pageNumber - 1) + 1;
 	int lastRecord = pageSize * pageNumber;
 	
 	
 	int block = (pageNumber - 1) / pageSize; 
 	
	ArrayList<BoardDTO> list = dao.getSelectAll(searchGubun, searchData, startRecord, lastRecord);
%>
totalRecord = <%=totalRecord %>
<div style="border: 0px solid red; padding-top: 10px; width: 80%;" align="left">
<% if(!searchGubun.equals("")) {%>
* 검색어 <%=searchData %>(으)로 검색된 목록 : <%=list.size() %>건
<%} else { %>
* 전체목록 <%=list.size() %>건<br>
<%} %>

</div>
<table border="1" width="80%" style="margin: 0px 20px;">
	<tr>
		
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
		
		<th>refNo</th>
		<th>stepNo</th>
		<th>levelNo</th>
		<th>parentNo</th>
		
		<th>memberNo</th>
		<th>ip</th>
		<th>공지글</th>
		<th>비밀글</th>
	</tr>

	<%
		for(int i=0; i < list.size(); i++){
			BoardDTO dto = list.get(i);
	%>
	<tr>
		<td>
		<%if(dto.getNoticeNo()>0){ %>
		      공지
		<%} else { %>
			<%=dto.getNo() %>
		<%} %>
		</td>
		<td>
			<%	
				String subject = dto.getSubject();
				String blankValue = "";
				for(int j=2; j <= dto.getStepNo(); j++){
					blankValue += "&nbsp;&nbsp;";
				}
				if(dto.getStepNo() > 1){
					blankValue += "└[Re]:";
				}
				if(dto.getSubject().length() > 5){
					subject = dto.getSubject().substring(0,6)+"...";
				}
			%>
			<%=blankValue%><a href="#" onclick="move('board_view','<%=dto.getNo()%>','<%=searchGubun%>','<%=searchData%>');"><%=subject %></a>
		</td>
		<td><%=dto.getWriter() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td><%=dto.getHit() %></td>
		
		<td><%=dto.getRefNo() %></td>
		<td><%=dto.getStepNo() %></td>
		<td><%=dto.getLevelNo() %></td>
		<td><%=dto.getParentNo() %></td>
		
		<td><%=dto.getMemberNo() %></td>
		<td><%=dto.getIp() %></td>
		<td><%=dto.getNoticeNo() %></td>
		<td><%=dto.getSecretGubun() %></td>
	</tr>
	<%
		}	
	%>
</table>
<div style="border: 0px solid red; padding-top: 10px; width: 80%;" align="center">
	<form name="searchForm">
		<select name="searchGubun">
		<option value=""  align="center" <%if(searchGubun.equals("")){ out.print("selected");} %>>-- 선택 --</option>
		<option value="writer" <%if(searchGubun.equals("writer")){ out.print("selected");} %>> 작성자 </option>
		<option value="subject" <%if(searchGubun.equals("subject")){ out.print("selected");} %>> 제목 </option>
		<option value="content" <%if(searchGubun.equals("content")){ out.print("selected");} %>> 내용 </option>
		<option value="writer_subject_content" <%if(searchGubun.equals("writer_subject_content")){ out.print("selected");} %>> 작성자+제목+내용 </option>
		</select>
		<input type="text" name="searchData" value="<%=searchData%>">
		<button type="button" onclick="search();">검색</button>
	</form>
	<script>
		function search() {
			var f = document.searchForm
			f.action = "main.jsp?menuGubun=board_listSearch";
			f.method = "post";
			f.submit();
		}
	
	</script>
	
</div>
<div style="border: 0px solid red; padding-bottom: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('board_list','','<%=searchGubun%>','<%=searchData%>');">목록</a>
		|
		<a href="#" onclick="move('board_chuga','','<%=searchGubun%>','<%=searchData%>');">등록</a>
		|
</div>
<script>
		function move(val1, val2, val3, val4){
			location.href = "main.jsp?menuGubun="+val1+"&no="+val2+"&searchGubun=" +val3 + "&searchData=" + val4;
		}
		
</script>






