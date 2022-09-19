package _test_exam.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import _common.Constants;
import _common.Util;

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
		
		Util util = new Util();
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();
		
//		System.out.println("path :"+ path);
//		System.out.println("url :"+ url);
//		System.out.println("uri :"+ uri);
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/exam/";
		request.setAttribute("path", path);
		
		
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
		} else if(imsiUriFileName.equals("json1.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"json1.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("join1Proc.do")){	
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String age_ = request.getParameter("age");
			int age = Integer.parseInt(age_);
			
			JSONObject jsonObject = new JSONObject();//import org.json.simple.JSONObject;
			jsonObject.put("id", id);
			jsonObject.put("passwd", passwd);
			jsonObject.put("name", name);
			jsonObject.put("age", age);
			
			String jsonMember = jsonObject.toString();
			System.out.println("1");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(jsonMember);
			out.flush();
			out.close();
		} else if(imsiUriFileName.equals("json2.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"json2.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("join2Proc.do")){		
			String name = request.getParameter("name");
			String kor_ = request.getParameter("kor");
			String eng_ = request.getParameter("eng");
			String mat_ = request.getParameter("mat");
			String sci_ = request.getParameter("sci");
			String his_ = request.getParameter("his");
			
			int kor = Integer.parseInt(kor_);
			int eng = Integer.parseInt(eng_);
			int mat = Integer.parseInt(mat_);
			int sci = Integer.parseInt(sci_);
			int his = Integer.parseInt(his_);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot/5.0;
			
			JSONObject jsonObject = new JSONObject();//import org.json.simple.JSONObject;
			jsonObject.put("name", name);
			jsonObject.put("kor", kor);
			jsonObject.put("eng", eng);
			jsonObject.put("mat", mat);
			jsonObject.put("sci", sci);
			jsonObject.put("his", his);
			jsonObject.put("tot", tot);
			jsonObject.put("avg", avg);
			
			String jsonMember = jsonObject.toString();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println(jsonMember);
			out.flush();
			out.close();
		} else if(imsiUriFileName.equals("attach1.do")){
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"attach1.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("attach1Proc.do")){
			String attachPath = Constants.ATTACH_PATH;
			int maxUpload = Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path +"/test";
			
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadPath,
					maxUpload,
					"utf-8",
					new DefaultFileRenamePolicy()
			); 
			
			String memo = multi.getParameter("memo");
			System.out.println(memo);
			
			String originalName = "-";
			String saveName = "-";
			long fileSize = 0;
			String fileType ="-";
			String mimeType = "-";
			
			
			File file_1 = multi.getFile("file_1");
			
			if(file_1 != null) { //첨부파일 있을시
				originalName = multi.getOriginalFileName("file_1");
				saveName = multi.getFilesystemName("file_1");
				fileSize = file_1.length();
				fileType = multi.getContentType("file_1");
				
				Tika tika = new Tika();
				mimeType = tika.detect(file_1);
				
				String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
				String newSaveName = util.getDateTime()+ "_" +util.createUuid() + "." + ext;
				if(fileType.equals(mimeType)) {
					File newFile = new File(uploadPath + "/" + newSaveName);
					file_1.renameTo(newFile);
					saveName = newSaveName;
				} else {
					file_1.delete();
					originalName = "-";
					saveName = "-";
					fileSize = 0;
					fileType ="-";
					mimeType = "-";
				}
			}
			String attachInfo = "";
			attachInfo += originalName + "|";
			attachInfo += saveName + "|";
			attachInfo += fileSize + "|";
			attachInfo += fileType + "|";
			attachInfo += mimeType;
			System.out.println(attachInfo);
			
			response.sendRedirect(path + "/exam_servlet/attach1.do");
		} else if(imsiUriFileName.equals("attachWhile.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"attachWhile.jsp");
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("attachWhileProc.do")){
			String attachPath = Constants.ATTACH_PATH;
			int maxUpload = Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path +"/test";
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadPath,
					maxUpload,
					"utf-8",
					new DefaultFileRenamePolicy()
			); 
			
			String attachCounter_ = multi.getParameter("attachCounter");
			int attachCounter = Integer.parseInt(attachCounter_);
			String[] array = new String[attachCounter];
			
			Enumeration files = multi.getFileNames();//첨부파일 집합
			while(files.hasMoreElements()) {
				String originalName = "-";
				String saveName = "-";
				long fileSize = 0;
				String fileType ="-";
				String mimeType = "-";
				
				String tagName = (String) files.nextElement();
				File f1 = multi.getFile(tagName);
				if(f1 != null) {
					originalName = multi.getOriginalFileName(tagName);
					saveName = multi.getFilesystemName(tagName);
					fileSize = f1.length();
					fileType = multi.getContentType(tagName);
					
					Tika tika = new Tika();
					mimeType = tika.detect(f1);
					
					String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
					String newSaveName = util.getDateTime()+ "_" +util.createUuid() + "." + ext;
					if(fileType.equals(mimeType)) {
						File newFile = new File(uploadPath + "/" + newSaveName);
						f1.renameTo(newFile);
						saveName = newSaveName;
					} else {
						f1.delete();
						originalName = "-";
						saveName = "-";
						fileSize = 0;
						fileType ="-";
						mimeType = "-";
					}
				}
				
				String attachInfo = "";
				attachInfo += originalName + "|";
				attachInfo += saveName + "|";
				attachInfo += fileSize + "|";
				attachInfo += fileType + "|";
				attachInfo += mimeType;
				
				int idx = Integer.parseInt(tagName);
				array[idx] = attachInfo;
			}
			
			String dispInfo = "";
			for(int i=0; i<array.length; i++) {
				dispInfo += "," + array[i];
				System.out.println(array[i]);
			}
			dispInfo = dispInfo.substring(1);
			System.out.println(dispInfo);
			
			response.sendRedirect(path + "/exam_servlet/attachWhile.do");
		} else if(imsiUriFileName.equals("attachFor.do")){
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage+"attachFor.jsp");
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("attachForProc.do")){
			String attachPath = Constants.ATTACH_PATH;
			int maxUpload = Constants.MAX_UPLOAD;
			
			String uploadPath = attachPath + path +"/test";
			MultipartRequest multi = new MultipartRequest(
					request,
					uploadPath,
					maxUpload,
					"utf-8",
					new DefaultFileRenamePolicy()
			); 
			
			String attachCounter_ = multi.getParameter("attachCounter");
			int attachCounter = Integer.parseInt(attachCounter_);
			String[] array = new String[attachCounter];
			
			for(int i=0; i<array.length;i++) {
				String originalName = "-";
				String saveName = "-";
				long fileSize = 0;
				String fileType ="-";
				String mimeType = "-";
				
				String tagName = "file_" + i;
				File f1 = multi.getFile(tagName);
				if(f1 != null) {
					originalName = multi.getOriginalFileName(tagName);
					saveName = multi.getFilesystemName(tagName);
					fileSize = f1.length();
					fileType = multi.getContentType(tagName);
					
					Tika tika = new Tika();
					mimeType = tika.detect(f1);
					
					String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
					String newSaveName = util.getDateTime()+ "_" +util.createUuid() + "." + ext;
					if(fileType.equals(mimeType)) {
						File newFile = new File(uploadPath + "/" + newSaveName);
						f1.renameTo(newFile);
						saveName = newSaveName;
					} else {
						f1.delete();
						originalName = "-";
						saveName = "-";
						fileSize = 0;
						fileType ="-";
						mimeType = "-";
					}
				}
				
				String attachInfo = "";
				attachInfo += originalName + "|";
				attachInfo += saveName + "|";
				attachInfo += fileSize + "|";
				attachInfo += fileType + "|";
				attachInfo += mimeType;
				
				String idx_ = tagName.replace("file_" , "");
				int idx = Integer.parseInt(idx_);
				array[idx] = attachInfo;
			}
			
			String dispInfo = "";
			for(int i=0; i<array.length; i++) {
				dispInfo += "," + array[i];
				System.out.println(array[i]);
			}
			dispInfo = dispInfo.substring(1);
			System.out.println(dispInfo);
			
			response.sendRedirect(path + "/exam_servlet/attachFor.do");	
		} else {
			System.out.println("없네");
		}
	}

}
