<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>상품등록</h2>

<form name="dirForm">
<table border="1">
   <tr>
      <td>상품카테고리</td>
      <td>
         <input type="radio" name="category" value="funiture">가구
         <input type="radio" name="category" value="clothe">의류
         <input type="radio" name="category" value="computer">컴퓨터
         <input type="radio" name="category" value="appliance">가전
      </td>
   </tr>
   <tr>
      <td>상품명</td>
      <td><input type="text" name="pname"></td>
   </tr>
   <tr>
      <td>가격</td>
      <td><input type="text" name="price"></td>
   </tr>
   <tr>
      <td colspan="2" align="center">
         <button type="button" onclick="check();">등록하기</button>
      </td>
   </tr>
</table>
</form>

<script>
   function check(){
      if(document.dirForm.category.value==null || document.dirForm.category.value==""){
         alert('카테고리를 선택하세요!');
      }else if(document.dirForm.pname.value==null || document.dirForm.pname.value.equals("")){
         alert('상품명을 입력하세요!');
      }else if(document.dirForm.price.value==null || document.dirForm.price.value.equals("")){
         alert('가격을 입력하세요!');
      }else{
         save();
      }
   }
   
   function save(){
      document.dirForm.action = "productProc1.jsp";
      document.dirForm.method = "post";
      document.dirForm.submit();
}
</script>