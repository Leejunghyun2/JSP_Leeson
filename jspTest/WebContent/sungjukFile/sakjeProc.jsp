<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_fileInfo.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");

	String newValue = "";
	
	int result = 0;
	try{
		
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()){
			String data = sReader.nextLine();
			int colonChk = data.indexOf(",");
			String nameChk = data.substring(0,colonChk);
			if(nameChk.equals(name)){
				continue;
			} else{
				newValue += data;
			}
			newValue += "\n";
		}
		sReader.close();
		FileWriter fw = new FileWriter(uploadFile);
		fw.write(newValue);
		fw.close();
		result = 1;
	}catch(Exception e){
		result = 0;
	}
	if(result > 0){
		out.println("<script>");
		out.println("alert('삭제성공');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	} else{
		out.println("<script>");
		out.println("alert('삭제 중 오류 발생');");
		out.println("history.back();");
		out.println("</script>");
	}
	
	
	
%>