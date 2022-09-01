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

   // MultipartRequest 인스턴스 생성 (cos.jar의 라이브러리)
   MultipartRequest multipartRequest = new MultipartRequest(
      request,
      uploadPath, 
      maxUpload,
      encoding,
      new DefaultFileRenamePolicy()
   );
   
   String productCode_ = multipartRequest.getParameter("productCode");
   String productName = multipartRequest.getParameter("productName");
   String productPrice_ = multipartRequest.getParameter("productPrice");
   String vendorCode_ = multipartRequest.getParameter("vendorCode");
   String attachCounter_ = multipartRequest.getParameter("attachCounter");

   productPrice_ = util.getNullBlankCheck(productPrice_, "0");
   vendorCode_ = util.getNullBlankCheck(vendorCode_, "0");
   attachCounter_ = util.getNullBlankCheck(attachCounter_, "0");
            
   int productCode = Integer.parseInt(productCode_);
   int productPrice = Integer.parseInt(productPrice_);
   int vendorCode = Integer.parseInt(vendorCode_);
   int attachCounter = Integer.parseInt(attachCounter_);
   
   File f2 = null;
   ShopProductDTO dto = new ShopProductDTO();
   dto.setProductCode(productCode);
    		  
   ShopProductDAO dao = new ShopProductDAO();
   dto = dao.getSelectOne(dto);
   
   String[] dbArray01 =dto.getAttachInfo().split(","); 		  
    		  
   String [] array = new String[attachCounter];
    		  
   Enumeration files = multipartRequest.getFileNames();
   while(files.hasMoreElements()){
	  String originalName = "-";
      String saveName = "-";
      long fileSize = 0;
      String fileType = "-";
      String mimeType = "-"; //Tika 라이브러리 필요함
      
      String tagName = (String) files.nextElement();
      File f1 = multipartRequest.getFile(tagName);
      
      int intTagName = Integer.parseInt(tagName);
      String[] dbArray02 = dbArray01[intTagName].split("[|]");
      
      if(f1 == null){
    	  originalName = dbArray02[0];
    	  saveName = dbArray02[1];
    	  fileSize = Integer.parseInt(dbArray02[2]);
    	  fileType = dbArray02[3];
    	  mimeType = dbArray02[4];
      }else {
    	  originalName = multipartRequest.getOriginalFileName(tagName);
          saveName = multipartRequest.getFilesystemName(tagName);
          fileSize = f1.length();
          fileType = multipartRequest.getContentType(tagName);
          Tika tika = new Tika();
          mimeType = tika.detect(f1);
          
          if (!fileType.equals(mimeType)) {//첨부파일 비정상
              File deleteFile = new File(uploadPath + "/" + saveName);
              if (deleteFile.exists()) {
                 deleteFile.delete();
              }//if
              originalName = "-";
              saveName = "-";
              fileSize = 0;
              fileType = "-";
              mimeType = "-";
           } else {//첨부파일 정상
          	 String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
          	 String newFileName = UUID.randomUUID().toString();
          	 
          	 File newFile = new File(uploadPath + "/" + newFileName);
          	 f1.renameTo(newFile);
          	 
          	 saveName = newFileName;
          	 
          	 f2 = new File(uploadPath + "/" + dbArray02[1]);
          	 
           }
      }
      System.out.println(tagName);
      String imsiOneFileInfo = originalName + "|";
      imsiOneFileInfo += saveName + "|";
      imsiOneFileInfo += fileSize + "|";
      imsiOneFileInfo += fileType + "|";
      imsiOneFileInfo += mimeType;
      array[intTagName] = imsiOneFileInfo;
      
   }

   
   String attachInfo = "";
		   
   for(int i=0; i<array.length; i++){
	   if(!attachInfo.equals("")){
	   		attachInfo += ",";
	   } 
		   attachInfo += array[i];
   }
		   
   ShopProductDTO arguShopProductDto = new ShopProductDTO();
   
   arguShopProductDto.setProductCode(productCode);
   arguShopProductDto.setProductName(productName);
   arguShopProductDto.setProductPrice(productPrice);
   arguShopProductDto.setVendorCode(vendorCode);
   arguShopProductDto.setAttachInfo(attachInfo);
   
   ShopProductDAO shopProductDao = new ShopProductDAO();
   int result = shopProductDao.setUpdate(arguShopProductDto);
   
   String resultPage = "shopProduct_list";
   out.println("<script>");
   if (result <= 0) {
      out.println("alert('수정 처리 중 오류가 발생했습니다.');");
      resultPage = "shopProduct_attachSujung&productCode="+productCode;
   }else{
	   if(f2.exists()){
    		 f2.delete();
    	 }
   }
   out.println("location.href = 'main.jsp?menuGubun=" + resultPage + "';");
   out.println("</script>");

%>