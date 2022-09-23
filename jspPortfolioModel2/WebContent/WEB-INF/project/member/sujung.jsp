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
			<td>
				${dto.jumin1 }-${dto.jumin2 }******
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<select name="phone1">
					<option value="">-- 선택 --</option>
					<c:choose>
						<c:when test="${dto.phone1 == 011 }"><%-- if와 같음 --%>
							<option value="010" >010</option>
							<option value="011" selected>011</option>
							<option value="016">016</option>
						</c:when>
						<c:when test="${dto.phone1 == 016 }"><%-- if와 같음 --%>
							<option value="010" >010</option>
							<option value="011" >011</option>
							<option value="016" selected>016</option>
						</c:when>
						<c:otherwise> <%-- else와 같음(그렇지 않으면) --%>
							<option value="010" selected>010</option>
							<option value="011" >011</option>
							<option value="016" >016</option>
						</c:otherwise>
					</c:choose>					
					
				</select>
				<input type="text" name="phone2" maxlength="4" value="${dto.phone2 }"  style="width: 50px;">
				<input type="text" name="phone3" maxlength="4" value="${dto.phone3 }" style="width: 50px;">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email1" style="width: 100px" value="${dto.email1 }">
				@
				<select name="email2">
					<option value="">-- 선택 --</option>
					<c:choose>
						<c:when test="${dto.phone1 == google.com }"><%-- if와 같음 --%>
							<option value="google.com" selected>google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</c:when>
						<c:when test="${dto.phone1 == daum.net }"><%-- if와 같음 --%>
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net" selected >daum.net</option>
						</c:when>
						<c:otherwise>
							<option value="google.com">google.com</option>
							<option value="naver.com" selected>naver.com</option>
							<option value="daum.net">daum.net</option>
						</c:otherwise>
					</c:choose>
				</select>
			</td>
		</tr>
		<tr>
			<td rowspan="3">주소</td>
			<td>
				<input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" value="${dto.postcode }" readonly>
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_address" placeholder="주소" name="address" readonly value="${dto.address }"><br>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="detailAddress" value="${dto.detailAddress }">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="extraAddress" value="${dto.extraAddress }">
			</td>
		</tr>
	
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="save();">수정</button>
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
		if(confirm('수정하시겠습니까?')){
			var f = document.DirForm;
			f.action = "${path }/member_servlet/member_sujungProc.do";
			f.method = "post";
			f.submit();
		}
	}
</script>	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>	
