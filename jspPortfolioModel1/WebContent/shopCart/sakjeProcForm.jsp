<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>    
<%
	
	String[] chk_ = request.getParameterValues("chk");
	if(chk_ == null){
		out.println("<script>");
		out.println("alert('선택항목이 없습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
		return;
	}
	int result = 0;
	//int cartNo = Integer.parseInt(cartNo_);
	for(int i=0; i<chk_.length; i++){
		int chk = Integer.parseInt(chk_[i]); 
	
	
	CartDTO arguDto = new CartDTO();
	arguDto.setCartNo(chk);
	CartDAO dao = new CartDAO();
	result = dao.setDelete(arguDto);
	
	}
	if(result > 0){
		out.println("<script>");
		out.println("location.href = 'main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
	}  else{
		out.println("<script>");
		out.println("alert('삭제 처리중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
	}
%>