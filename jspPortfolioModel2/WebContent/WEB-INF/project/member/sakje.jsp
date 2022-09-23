<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원등록</h2>
<%@ include file="../include/inc_header.jsp" %> 
<form name="DirForm">
<input type="hidden" name="no" value="${dto.no }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				${dto.id }
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd" value=""></td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${dto.jumin1 }-${dto.jumin2 }******</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				${dto.phone1 }-${dto.phone2 }-${dto.phone3 }
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				${dto.email1 }
				@
				${dto.email2 }
			</td>
		</tr>
		<tr>
			<td >주소</td>
			<td>
				${dto.postcode }
				${dto.address }
				${dto.detailAddress }
				${extraAddress }
			</td>
		</tr>
		<tr>
			<td>등록일</td>
			<td>${dto.regiDate }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">삭제</button>
				<button type="button" onclick="move('member_list.do','');">목록</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function move(val1, val2){
		location.href = '${path }/member_servlet/' + val1 + '?no=' + val2 +"&${searchQuery}";
	}
	function save(){
		if(confirm('삭제하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/member_servlet/member_sakjeProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>

	
