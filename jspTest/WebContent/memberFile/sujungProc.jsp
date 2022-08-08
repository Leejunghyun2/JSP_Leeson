<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	if(passwd == null || !passwd.equals(passwdChk)){
		out.println("<script>");
		out.println("alert('비밀번호가 틀립니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	String msg = id+","+passwd+","+passwdChk+","+name+","+phone+","+email+","+address+"\n";
	
	String attachPath = "c:/LJH/attach"; //    c:\\??\\attach 이렇게 적어도됨
	String uploadPath = attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/member.txt";
	String temp = "";
	
	try{
		File f = new File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()){
			String date = sReader.nextLine();
			String[] name1 = date.split(",");
			if(name1[0].equals(id)){
				System.out.println(date);
				temp += msg;
			} else{
				temp += date + "\n";
			}
		}
		sReader.close();
		if(!msg.equals("")){
		FileWriter fw = new FileWriter(uploadFile);
		fw.write(temp);
		fw.close();
		System.out.println(temp);
		out.print("<script>");
		out.print("alert('파일수정완료');");
		out.print("location.href = 'list.jsp';");
		out.print("</script>");
		}
	}catch (Exception e){
		//e.printStackTrace();

	}
%>