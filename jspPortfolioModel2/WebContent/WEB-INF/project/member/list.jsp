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
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>전화번호</td>
			<td>가입일</td>
		</tr>
		<c:if test="${totalRecord == 0 }">
		<tr>
			<td colspan="7" style="width: 300px; height: 100px;" align="center">등록된 회원이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach var="memberDto" items="${list }">
			<tr>
				<td>${memberDto.no }</td>
				<td><a href="#" onclick="move('member_view.do','${memberDto.no}')">${memberDto.id }</a></td>
				<td>${memberDto.passwd }</td>
				<td>${memberDto.name }</td>
				<td>${memberDto.jumin1 }-${memberDto.jumin2 }******</td>
				<td>${memberDto.phone1 }-${memberDto.phone2 }-${memberDto.phone3 }</td>
				<td>${memberDto.regiDate }</td>
			</tr>
		</c:forEach>
	</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="${path }/member_servlet/member_list.do">전체목록</a>
		|
		<a href="#" onclick="move('member_list.do','')">목록</a>
		|
		<a href="#" onclick="move('member_chuga.do','')">등록</a>
		|
</div>
<div style="height:50px; display:flex; justify-content: center; align-items: center; margin: 1rem 0px 1rem 0px">
   <form name="searchForm">
      <div style="display:flex; height:30px">
         <select name="searchGubun" id="searchGubun" style="width: 80px; text-overflow:ellipsis; border:0px">
            <option value="" selected >-선택-</option>
            <option value="id"  <c:if test="${searchGubun == 'id' }">selected</c:if>>아이디</option>
            <option value="name"  <c:if test="${searchGubun == 'name' }">selected</c:if>>이름</option>
            <option value="id_name"  <c:if test="${searchGubun == 'id_name' }">selected</c:if> >아이디+이름</option>
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
	    searchForm.action="${path}/member_servlet/member_search.do";
	    searchForm.method="post";
	    searchForm.submit();
	 }
	function move(val1, val2){
		location.href = '${path }/member_servlet/' + val1 + '?no=' + val2 +"&${searchQuery}";
	}
	function goPage(val1){
		location.href = '${path }/member_servlet/member_list.do?pageNumber=' + val1 + '&${searchQuery}';
	}
</script>