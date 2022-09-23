<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table bodder="0" aling="center" width="90%">
	<tr>
		<td colspan="5" style="padding: 0px 0px 0px 20px;">
		   Location : project -> ${folderName } -> ${fileName }
		</td>
		<td colspan="4" style="padding: 0px 0px 0px 20px;" align="right">
		   접속 IP : ${ip }
		</td>
	</tr>
	<tr align="center">
		<td style="padding: 0px 10px;" id="home">
			<a href="${path }/dashBoard_index.do">HOME</a>
		</td>
		<td style="padding: 0px 10px;" id="member">
			<a href="${path }/member_servlet/member_list.do">회원관리</a>
		</td>
		<td style="padding: 0px 10px;" id="memo">
			<a href="${path }/memo_servlet/memo_list.do">메모장</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBook">
			<a href="#">방명록</a>
		</td>
		<td style="padding: 0px 10px;" id="board">
			<a href="#">게시판</a>
		</td>
		<td style="padding: 0px 10px;" id="shopProduct">
			<a href="#">Mall(상품관리)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopVendor">
			<a href="#">Mall(제조사)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopMall">
			<a href="#">Mall(쇼핑몰)</a>
		</td>
		<td style="padding: 0px 10px;" id="home">
			<a href="#">Chart</a>
		</td>
	</tr>
</table>