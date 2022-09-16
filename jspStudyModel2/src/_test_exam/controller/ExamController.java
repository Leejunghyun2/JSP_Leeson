package _test_exam.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/exam_servlet/*")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
//		System.out.println("path :"+ path);
//		System.out.println("url :"+ url);
//		System.out.println("uri :"+ uri);
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/exam/";
		
		if(imsiUriFileName.equals("01.do")) {  //indexof 는 없으면 -1
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"01.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("01Proc.do")){
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"01Result.jsp");
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("02Proc.do")){
			String name = request.getParameter("name");
			String birth_ = request.getParameter("birth");
			
			
			int birth = Integer.parseInt(birth_);
			int age = 2022 - birth + 1;
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"02Result.jsp");
			rd.forward(request, response);
			
				
		} else if(imsiUriFileName.equals("02.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"02.jsp");
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("03.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"03.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("03Proc.do")){
			String name = request.getParameter("name");
			String jumin1 = request.getParameter("jumin1");
			String jumin2 = request.getParameter("jumin2");
			String address = request.getParameter("address");
			String gender = "남";
			
			String birth_ = jumin1.substring(0,2);
			String imsigender = jumin2.substring(0,1);
			if(imsigender.equals("3")||imsigender.equals("4")) {
				birth_ = "20" + birth_;
			}else if(imsigender.equals("2")||imsigender.equals("1")) {
				birth_ = "19" + birth_;
			}
			
			if(imsigender.equals("2")||imsigender.equals("4")) {
				gender = "여";
			}
			int birth = Integer.parseInt(birth_);
			int age = 2022 - birth + 1;
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			request.setAttribute("gender", gender);
			
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"03Result.jsp");
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("04.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"04.jsp");
			rd.forward(request, response);
		
		} else if(imsiUriFileName.equals("04Proc.do")){	
			String formCounter_ = request.getParameter("formCounter");
			int formCounter = Integer.parseInt(formCounter_);
			
			ArrayList<String> list = new ArrayList<>();
			for(int i=1; i <= formCounter; i++) {
				String name =request.getParameter("name_" + i);
				String address =request.getParameter("address_" + i);
				String age_ =request.getParameter("age_" + i);
				int age = Integer.parseInt(age_);
				
				String msg = name + "|" + address + "|" + age;
				list.add(msg);
			}
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"04Result.jsp");
			rd.forward(request, response);	
					
					
			
		} else if(imsiUriFileName.equals("05.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"05.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("05Proc.do")){
			String[] name_ = request.getParameterValues("name");
			String gender = request.getParameter("gender");
			String aboutAge = request.getParameter("aboutAge");
			String[] hobby_ = request.getParameterValues("hobby");
			String age_ = request.getParameter("age");
			String memo = request.getParameter("memo");
			String birthDay = request.getParameter("birthDay");
			
			String name = "";
			String hobby = "";
			int age = Integer.parseInt(age_);
			
			for(int i=0; i < name_.length; i++) {
				if(name.equals("")) {
					name += name_[i];
				} else {
					name += "," + name_[i];
				}
			}
			for(int i=0; i < hobby_.length; i++) {
				if(hobby.equals("")) {
					hobby += hobby_[i];
				} else {
					hobby += "," + hobby_[i];
				}
			}
			HashMap<String, Object> map = new HashMap<>();
			map.put("name", name);
			map.put("gender", gender);
			map.put("aboutAge", aboutAge);
			map.put("hobby", hobby);
			map.put("age", age);
			map.put("birthDay", birthDay);
			memo = memo.replace("\n", "<br>");
			map.put("memo", memo);
			request.setAttribute("map", map);
		
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"05Result.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("06.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"06.jsp");
			rd.forward(request, response);
		
		} else if(imsiUriFileName.equals("06Proc.do")){	
			String testDbId = "hong";
			String testDbPw = "1234";
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String msg = "X";
			
			if(testDbId.equals(id) && testDbPw.equals(passwd)) {
					msg = "O";
			}
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"06Result1.jsp");
			rd.forward(request, response);
			
//			response.sendRedirect("/jspStudyModel2/exam_servlet/06Proc2.do?id="+id+"&msg="+msg);
		} else if(imsiUriFileName.equals("06Proc2.do")){
			String id = request.getParameter("id");
			String msg = request.getParameter("msg");
			
			request.setAttribute("id", id);
			request.setAttribute("msg", msg);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"06Result2.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("07.do")){
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			
			if(name == null || name.trim().equals("")) {
				name = "";
			}
			if(address == null || address.trim().equals("")) {
				address = "";
			}
			if(age_ == null || age_.trim().equals("")) {
				age_ = "";
			}
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age_);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"07.jsp");
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("07Proc.do")){
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			request.setAttribute("name", name);
			request.setAttribute("address", address);
			request.setAttribute("age", age);
			request.setAttribute("op", "readonly");
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"07Result.jsp");
			rd.forward(request, response);
			
		} else {
			System.out.println("없네");
		}
	}

}
