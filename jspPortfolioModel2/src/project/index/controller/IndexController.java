package project.index.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;


@WebServlet("/") // /jspPortfolioModel2/ <-- 함축된 의미
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
		
		folderName = "dashBoard";
		fileName = "index";
		
		request.setAttribute("path", path);
		request.setAttribute("ip", ip);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName + ".jsp");  // main안에서 이루어지기위해 매개변수를 날림
		String forwardPage = "/WEB-INF/project/main/main.jsp"; //index.jsp 파일이 있는경로 설정
		RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
		rd.forward(request, response);
	}


}
