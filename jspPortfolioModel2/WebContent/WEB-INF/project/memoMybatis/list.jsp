<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원관리</h2>
<%@ include file="../include/inc_header.jsp" %> 
<div style="border: 0px solid red; padding-top: 0px; width: 80%;" align="left">
<c:choose>
	<c:when test="${searchData == '' }">
  		전체목록 : ${totalRecord } 건
  	</c:when>
  	<c:otherwise>
  		검색어 '<font color="red" style="font-weight: bolder;">${searchData }</font>'(으)로 검색한 목록 ${totalRecord }건
  	</c:otherwise>
</c:choose> 
(${pageNumber } / ${totalPage })
</div>
	<table border="1" width="80%">
		<tr>
			<td>순번</td>
			<td>작성자</td>
			<td>메모내용</td>
			<td>등록일</td>
			<td></td>
		</tr>
		<c:if test="${fn:length(list) == 0 }">
		<tr>
			<td colspan="6" style="width: 300px; height: 100px;">등록된 내용이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="memo" items="${list }">
			<tr>
				<td>${memo.no }</td>
				<td>${memo.writer }</td>
				<td>${memo.content }</td>
				<td>${memo.regiDate }</td>
				<td>
					<a href="#" onclick="move('memoMybatis_sujung.do','${memo.no}')">[수정]</a>
					<a href="#" onclick="move('memoMybatis_sakje.do','${memo.no}')">[삭제]</a>
				</td>
			</tr>
		</c:forEach>
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('memoMybatis_list.do','')">목록</a>
		|
		<a href="#" onclick="move('memoMybatis_chuga.do','')">등록</a>
		|
</div>
<div style="height:50px; display:flex; justify-content: center; align-items: center; margin: 1rem 0px 1rem 0px">
   <form name="searchForm">
      <div style="display:flex; height:30px">
         <select name="searchGubun" id="searchGubun" style="width: 80px; text-overflow:ellipsis; border:0px">
            <option value="" selected >-선택-</option>
            <option value="writer"  <c:if test="${searchGubun == 'writer' }">selected</c:if>>작성자</option>
            <option value="content"  <c:if test="${searchGubun == 'content' }">selected</c:if>>내용</option>
            <option value="writer_content"  <c:if test="${searchGubun == 'writer_content' }">selected</c:if> >작성자+내용</option>
         </select>
         <input type="text"  name="searchData"  id="searchData" value="${searchData }"
         style="border:1px solid lightgrey; border-left:0px; border-right:0px; outline: none" placeholder="입력하세요">
         <button type="button" onClick="search()" style="border:0">검색</button>
      </div>
   </form>
</div>
<c:if test="${totalRecord > 0 }">
	<div style="border: 0px solid red; padding-top: 0px; width: 80%;" align="center">
	<c:set var="totalBlock" value="${(totalPage / blockSize) - 1}"></c:set>
	<c:set var="val1" value="${(totalPage / blockSize)}"></c:set>
	<c:set var="val2" value="${(totalPage / blockSize)}"></c:set>
	
	<c:if test="${pageNumber > 1 }">
		<a href="#" onclick="goPage('1');">[첫페이지]</a>
	</c:if>
	<c:if test="${pageNumber <= 1 }">
		[첫페이지]
	</c:if>
	
	
	<c:if test="${block <= 0 }">
	[이전${blockSize }개]
	</c:if>
	<c:if test="${block > 0 }">
		<a href="#" onclick="goPage('${block * blockSize}')">[이전${blockSize }개]</a>
	</c:if>
	
	
		<c:forEach var="i" begin="1" end="${blockSize }" step="1" varStatus="status">
			<c:set var="imsiValue" value="${block * blockSize + i}"/>
			<c:if test="${totalPage - imsiValue >= 0 }">
				<c:if test="${imsiValue == pageNumber }">
					[${imsiValue }]
				</c:if>
				<c:if test="${imsiValue != pageNumber }">
					<a href="#" onclick="goPage('${imsiValue}');">[${imsiValue }]</a>
				</c:if>
			</c:if>
		</c:forEach>
		
		
	<c:if test="${block < totalBlock }">
		<a href="#" onclick="goPage('${block * blockSize + blockSize + 1}');">[다음${blockSize }개]</a>
	</c:if>
	<c:if test="${block >= totalBlock }">
		[다음${blockSize }개]
	</c:if>
	
	
	<c:if test="${pageNumber >= totalPage }">
		[끝페이지]
	</c:if>
	<c:if test="${pageNumber < totalPage }">
		<a href="#" onclick="goPage('${totalPage}');">[끝페이지]</a>
	</c:if>
	
	
	</div>
</c:if>
<script>
	function search() {
	    searchForm.action="${path}/memoMybatis_servlet/memoMybatis_search.do";
	    searchForm.method="post"; 
	    searchForm.submit();
	 }
	function goPage(val1){
		location.href = '${path }/memoMybatis_servlet/memoMybatis_list.do?pageNumber=' + val1 + '&${searchQuery}';
	}
	function move(val1, val2){
		location.href = '${path }/memoMybatis_servlet/' + val1 + '?no=' + val2 + "&${searchQuery}";
	}
</script>