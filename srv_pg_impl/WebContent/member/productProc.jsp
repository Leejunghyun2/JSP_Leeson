<%@page import="member.model.memberDao.ProductDAO"%>
<%@page import="member.model.memberDto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String cate = request.getParameter("cate");
	String pname = request.getParameter("pname");
	String price_ = request.getParameter("price");
	
	int price = Integer.parseInt(price_);
	


	ProductDTO arguDto = new ProductDTO();
	arguDto.setCate(cate);
	arguDto.setPname(pname);
	arguDto.setPrice(price);
	
	ProductDAO dao = new ProductDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('성공');");
		out.println("location.href = 'productList.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생');");
		out.println("location.href = 'product.jsp'");
		out.println("</script>");
	}
	
	
%>