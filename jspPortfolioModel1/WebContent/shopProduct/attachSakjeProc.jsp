<%@page import="org.apache.tika.Tika"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%
   File isDir = new File(uploadPath);
   if (isDir.exists()) {
      try {
         isDir.mkdirs();   
      } catch (Exception e) {
         e.printStackTrace();
      }//try-catch
   }//if


   
   String productCode_ = request.getParameter("productCode");

            
   int productCode = Integer.parseInt(productCode_);
   
   File f2 = null;
   ShopProductDTO dto = new ShopProductDTO();
   dto.setProductCode(productCode);
    		  
   ShopProductDAO dao = new ShopProductDAO();
   dto = dao.getSelectOne(dto);
   
   String[] imsiArray01 =  dto.getAttachInfo().split(",");
   for(int i=0; i<imsiArray01.length; i++){
	   String[] imsiArray02 = imsiArray01[i].split("[|]");
	   f2 = new File(uploadPath + "/" + imsiArray02[1]);
	   if(f2.exists()){
		   f2.delete();
	   }
   }
    		  
   int result = dao.setDelete(dto);
   String resultPage = "shopProduct_list";
   out.println("<script>");
   if (result <= 0) {
      out.println("alert('삭제 처리 중 오류가 발생했습니다.');");
      resultPage = "shopProduct_attachSujung&productCode="+productCode;
   }else{
	   if(f2.exists()){
    		 f2.delete();
    	 }
   }
   out.println("location.href = 'main.jsp?menuGubun=" + resultPage + "';");
   out.println("</script>");

%>