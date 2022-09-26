<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원등록</h2>
<%@ include file="../include/inc_header.jsp" %> 
	<table border="1" width="80%">
		<tr>
			<td>작성자</td>
			<td>
				${dto.writer }
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${dto.subject }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${dto.content }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<td>refNo</td>
			<td>
				${dto.refNo}
			</td>
		</tr>
		<tr>
			<td>stepNo</td>
			<td>
				${dto.stepNo}
			</td>
		</tr>
		<tr>
			<td>levelNo</td>
			<td>
				${dto.levelNo}
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>
				${dto.hit }
			
			</td>
		</tr>
		<tr>
			<td >ip</td>
			<td>
				${dto.ip }
			</td>
		</tr>
		<tr>
			<td >membeNo</td>
			<td>
				${dto.memberNo }
			</td>
		</tr>
		<tr>
			<td >noticeNo</td>
			<td>
				${dto.noticeNo }
			</td>
		</tr>
		<tr>
			<td >secretGubun</td>
			<td>
				${dto.secretGubun }
			</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${dto.regiDate }</td>
		</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="left">
	<table>
		<tr>
			<td>
				이전회원 
			</td>
			<td>
				<c:choose>
					<c:when test="${dto.preNo <= 0 }">
						이전 회원이 없습니다.
					</c:when>
					<c:otherwise>
						<a href="#" onclick="move('board_view.do','${dto.preNo}')">${dto.preSubject }</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>
				다음회원 
			</td>
			<td>
			<c:choose>
					<c:when test="${dto.nxtNo <= 0 }">
						다음 회원이 없습니다.
					</c:when>
					<c:otherwise>
						<a href="#" onclick="move('board_view.do','${dto.nxtNo}')">${dto.nxtSubject }</a>
					</c:otherwise>
			</c:choose>
			</td>
		</tr>
	</table>
</div>	
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
		|
		<a href="#" onclick="move('board_list.do','')">목록</a>
		|
		<a href="#" onclick="move('board_chuga.do','')">등록</a>
		|
		<a href="#" onclick="move('board_sujung.do','${dto.no }')">수정</a>
		|
		<a href="#" onclick="move('board_sakje.do','${dto.no }')">삭제</a>
		|
</div>
<script>
	function move(val1, val2){
		location.href = '${path }/board_servlet/' + val1 + '?no=' + val2  + "&${searchQuery}";
	}
</script>

	
