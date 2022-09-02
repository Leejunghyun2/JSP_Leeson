<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>    
<%
	
	String choiceNo_ = request.getParameter("choiceNo");
	util.getNullBlankCheck(choiceNo_, "");
	if(choiceNo_.equals("")){
		out.println("<script>");
		out.println("alert('선택항목이 없습니다.');");
		out.println("location.href = 'main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
		return;
	}
	String[] choiceNo = choiceNo_.split(",");
	CartDAO dao = new CartDAO();
	int result = dao.setDeleteBatch(choiceNo);
	
	//int cartNo = Integer.parseInt(cartNo_);
	/* for(int i=0; i<choiceNo.length; i++){ 
		int chk = Integer.parseInt(choiceNo[i]); 
	
	
	CartDTO arguDto = new CartDTO();
	arguDto.setCartNo(chk);
	CartDAO dao = new CartDAO();
	result = dao.setDelete(arguDto);
	
	} */

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