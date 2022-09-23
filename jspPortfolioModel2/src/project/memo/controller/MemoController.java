package project.memo.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.memo.model.dao.MemoDAO;
import project.memo.model.dto.MemoDTO;


@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet {
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
		String forwardPage = "/WEB-INF/project/main/main.jsp"; //index.jsp 파일이 있는경로 설정
		if(fileName.equals("list")) {
			MemoDAO dao = new MemoDAO();
			ArrayList<MemoDTO> list = dao.getSelectAll();
			
			
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0 ) {
				return;
			}
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			
			MemoDAO MemoDAO = new MemoDAO();
			MemoDTO resultDto = MemoDAO.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			if(no == 0 ) {
				return;
			}
			MemoDAO MemoDAO = new MemoDAO();
			MemoDTO resultDto = MemoDAO.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			MemoDTO arguDto = new MemoDTO();
			arguDto.setNo(no);
			if(no == 0 ) {
				return;
			}
			MemoDAO MemoDAO = new MemoDAO();
			MemoDTO resultDto = MemoDAO.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chugaProc")) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			content = util.getCheckString(content);
			
			MemoDTO dto = new MemoDTO();
			dto.setWriter(writer);
			dto.setContent(content);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setInsert(dto);
			if(result > 0) {
				response.sendRedirect(path+"/memo_servlet/memo_list.do");
			} else {
				response.sendRedirect(path+"/memo_servlet/memo_chuga.do");
			}
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			content = util.getCheckString(content);
		

			MemoDTO dto = new MemoDTO();
			dto.setNo(no);
			dto.setWriter(writer);
			dto.setContent(content);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setUpdate(dto);
			if(result > 0) {
				response.sendRedirect(path+"/memo_servlet/memo_list.do");
			} else {
				response.sendRedirect(path+"/memo_servlet/memo_sujung.do?no="+no);
			}
			
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			MemoDTO dto = new MemoDTO();
			dto.setNo(no);
			
			MemoDAO dao = new MemoDAO();
			int result = dao.setDelete(dto);
			if(result > 0) {
				response.sendRedirect(path+"/memo_servlet/memo_list.do");
			} else {
				response.sendRedirect(path+"/memo_servlet/memo_sakje.do?no="+no);
			}
		}
		
	
	}

}
