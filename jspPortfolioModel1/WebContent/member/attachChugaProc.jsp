<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String attachPath = "/C:/LJH/attach";
	String uploadPath = attachPath + request.getContextPath()+"/member";
	final int maxUpload = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	

	MultipartRequest multi = new MultipartRequest(
		request,
		uploadPath,
		maxUpload,
		encoding,
		new DefaultFileRenamePolicy()
	); 
	
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String passwdChk = multi.getParameter("passwdChk");
	String name = multi.getParameter("name");
	String phone = multi.getParameter("phone");
	String email = multi.getParameter("email");
	String jumin1 = multi.getParameter("jumin1");
	String jumin2 = multi.getParameter("jumin2");
	String juso1 = multi.getParameter("juso1");
	String juso2 = multi.getParameter("juso2");
	String juso3 = multi.getParameter("juso3");
	String juso4 = multi.getParameter("juso4");
	String grade = multi.getParameter("grade");
	
	String jumin = jumin1 +"-"+jumin2;
	if(juso4 == null || juso4.trim().equals("")){
		juso4 = "-";
	}
	
	String attachInfo = "";
	try{
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()){
			String tagName = "";
			String fileOriginalName = ""; //파일의 원래이름
			String fileSavedName = "";	//탐색기에 올라가있는이름 
			String fileType = "";
			String fileSize ="";
			String fileExtName =""; //확장자
			String newFileName = "";
			
			tagName = (String)files.nextElement(); //html에서 작성한 파일의 이름
			
			//out.println("tagName :" + tagName);
			
			File fileObj = multi.getFile(tagName); //파일이 있나 없나 확인
			
			//out.println("fileObj :" + fileObj);
			
			if(fileObj != null){ 
				fileOriginalName = multi.getOriginalFileName(tagName);
				fileSavedName = multi.getFilesystemName(tagName);
				fileType =multi.getContentType(tagName);
				fileSize = String.valueOf(fileObj.length());
				fileExtName = fileSavedName.substring(fileSavedName.lastIndexOf(".") + 1 );
				fileExtName = fileExtName.toLowerCase(); 
				
				
				int errorCounter = 0;
				if(fileExtName.toLowerCase().equals("png")){
					
				} else if (fileExtName.toLowerCase().equals("jpeg")){
					
				} else if(fileExtName.toLowerCase().equals("jpg")){
					
				} else if (fileExtName.toLowerCase().equals("gif")){
					
				} else {
					errorCounter++;
				}
				if(errorCounter > 0){
					String deleteFilePath = uploadPath + "/" + fileSavedName;
					File f = new File(deleteFilePath);
					if(f.delete()){
						
					} else {
						
					}
				    fileOriginalName = ""; //파일의 원래이름
					fileSavedName = "";	//탐색기에 올라가있는이름 
					fileType = "";
					fileSize ="";
					
				}
				
				
				
				
				
				newFileName = UUID.randomUUID().toString() + "." + fileExtName;
				String oldFilePath = uploadPath + "/" + fileSavedName;
				String newFilePath = uploadPath + "/" + newFileName;
				File f1 = new File(oldFilePath);
				
				
				if(f1.exists()){
					File newFile = new File(newFilePath);
					f1.renameTo(newFile);
					fileSavedName = newFileName;
				}
				if(!attachInfo.trim().equals("")){
					attachInfo += ","; 
				}
				attachInfo += fileOriginalName + "|";
				attachInfo += fileSavedName + "|";
				attachInfo += fileType + "|";
				attachInfo += fileSize;
			}
				
				
				
		}
	}catch(Exception e){
		//e.printStackTrace();
	}
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setPhone(phone);
		dto.setEmail(email);
		dto.setJumin(jumin);
		dto.setJuso1(juso1);
		dto.setJuso2(juso2);
		dto.setJuso3(juso3);
		dto.setJuso4(juso4);
		dto.setGrade(grade);
		dto.setAttachInfo(attachInfo);
		
		MemberDAO dao = new MemberDAO();
		int result = dao.setInsert(dto);
		
		if(result > 0){
			out.println("<script>");
			//out.println("");
			out.println("location.href = 'main.jsp?menuGubun=member_list';");
			out.println("</script>");
		}  else{
			out.println("<script>");
			out.println("alert('등록 중 오류가 발생했습니다.')");
			out.println("location.href = 'main.jsp?menuGubun=member_chuga';");
			out.println("</script>");
		}
		
		
	
%>