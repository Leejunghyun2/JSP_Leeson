<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="_inc_fileInfo.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String scie_ = request.getParameter("scie");
	String his_ = request.getParameter("his");
	
	String msg = name + "," + kor_ + "," + eng_ + "," + mat_ + "," + scie_ + "," + his_;

	String newValue = "";
	
	int result = 0;
	try{
		
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()){
			String data = sReader.nextLine();
			int colonChk = data.indexOf(",");
			String nameChk = data.substring(0,colonChk);
			if(nameChk.equals(name)){
				newValue += msg;
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
		out.println("alert('수정성공');");
		out.println("location.href = 'view.jsp?name="+name+"';");
		out.println("</script>");
	} else{
		out.println("<script>");
		out.println("alert('수정 중 오류 발생');");
		out.println("history.back();");
		out.println("</script>");
	}
	
	
	
%>