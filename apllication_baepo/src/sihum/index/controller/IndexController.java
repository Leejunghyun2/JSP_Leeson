package sihum.index.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		imsiUriFileName = imsiUriFileName.replace(".do", ""); //dashBoard_index
		if(imsiUriFileName.equals("apllicatin_baepo")) {
			imsiUriFileName = "member_list.do";
		}
		
		String[] imsiArray = imsiUriFileName.split("_"); 
		String folderName = imsiArray[0];
		String fileName = imsiArray[1];
		
		
		folderName = "member";
		fileName = "list";
		
		request.setAttribute("path", path);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName + ".jsp");  // main안에서 이루어지기위해 매개변수를 날림
		String forwardPage = "/WEB-INF/sihum/main/main.jsp"; //index.jsp 파일이 있는경로 설정
		RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
		rd.forward(request, response);
	}

}
