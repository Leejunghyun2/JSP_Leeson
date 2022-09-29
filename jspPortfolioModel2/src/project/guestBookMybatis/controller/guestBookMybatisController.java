package project.guestBookMybatis.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;


@WebServlet("/guestBookMybatis_servlet/*")
public class guestBookMybatisController extends HttpServlet {
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
		
		String[] serverInfo = util.getServerInfo(request);
		String referer = serverInfo[0]; //이전페이지
		String path = serverInfo[1]; // 프로젝트명
		String url = serverInfo[2]; // http://localhost:8090/jspPortfolioModel2 그뒤주소
		String uri = serverInfo[3]; // path + 그뒤 주소
		String ip = serverInfo[4]; // ip
		String ip6 = serverInfo[5];
		String folderName = serverInfo[6];
		String fileName = serverInfo[7];
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName + ".jsp");  // main안에서 이루어지기위해 매개변수를 날림
		
		String[] sessionArray = util.getSessionCheck(request);
		int sessionNo = Integer.parseInt(sessionArray[0]);
		String sessionId = sessionArray[1];
		String sessionName = sessionArray[2];
		
//		if(sessionNo <= 0 ) { //로그인 안한 상태
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('로그인 후 이용 해주세요')");
//			out.println("location.href = '" + path + "';");
//			out.println("</script>");
//			return;
//		}
		
		
		
		String pageNumber_ = request.getParameter("pageNumber");
		String searchGubun = request.getParameter("searchGubun");
		String searchData = request.getParameter("searchData");
		
		int pageNumber = util.getNumberCheck(pageNumber_, 1);
		
		String imsiSearchYN = "O";
		searchGubun = util.getNullBlankCheck(searchGubun);
		searchData = util.getNullBlankCheck(searchData);
		
		if(searchGubun.equals("")||searchData.equals("")) {
			imsiSearchYN = "X";
			searchData ="";
			searchGubun ="";
		}
		
		searchGubun = URLDecoder.decode(searchGubun , "utf-8");
		searchData = URLDecoder.decode(searchData, "utf-8");
		String searchQuery = "pageNumber=" + pageNumber;
		searchQuery += "&searchGubun=&searchData=";
		if(imsiSearchYN.equals("O")) {
			String imsiSearchGubun = URLEncoder.encode(searchGubun,"utf-8");
			String imsiSearchData = URLEncoder.encode(searchData,"utf-8");
			searchQuery = "pageNumber=" + pageNumber;
			searchQuery = "&searchGubun="+imsiSearchGubun + "&searchData=" + imsiSearchData;
		}
		
	
		
		request.setAttribute("searchQuery", searchQuery);
		request.setAttribute("searchGubun", searchGubun);
		request.setAttribute("searchData", searchData);
		
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("list")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chugaProc")) {
			
		} else if(fileName.equals("sujung")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sujungProc")) {
			
		} else if(fileName.equals("sakje")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sakjeProc")) {
			
		} else if(fileName.equals("view")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else {
			return;
		}
	}

}
