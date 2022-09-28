package project.memoMybatis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.common.Util;
import project.memoMybatis.model.dao.MemoMybatisDAO;
import project.memoMybatis.model.dto.MemoMybatisDTO;


@WebServlet("/memoMybatis_servlet/*")
public class MemoMybatisController extends HttpServlet {
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
			int pageSize = 3;
			int blockSize = 3;
			MemoMybatisDTO arguDto2 = new MemoMybatisDTO();
			arguDto2.setSearchGubun(searchGubun);
			arguDto2.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			
			int totalRecord = dao.getTotalRecord(arguDto2);
	        int block = (pageNumber - 1) / blockSize;
	        int jj = totalRecord - pageSize * (pageNumber - 1);
	        
	        double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	        int totalPage = (int)totalPageDou;
	        
	        int startRecord = pageSize * (pageNumber - 1) + 1;
	        int lastRecord = pageSize * pageNumber;
	        int totalBlock = totalPage / blockSize;
	        
	        MemoMybatisDTO arguDto = new MemoMybatisDTO();
	        arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
	        arguDto.setStartRecord(startRecord);
	        arguDto.setLastRecord(lastRecord);
	        
	        List<MemoMybatisDTO> list = dao.getSelectAll(arguDto);
	        
	        request.setAttribute("list", list);
	        request.setAttribute("totalPage", totalPage);
	        request.setAttribute("totalRecord", totalRecord);
	        request.setAttribute("pageSize", pageSize);
	        request.setAttribute("pageNumber", pageNumber);
	        request.setAttribute("blockSize", blockSize);
	        request.setAttribute("block", block);
	        request.setAttribute("jj", jj);
	        request.setAttribute("startRecord", startRecord);
	        request.setAttribute("lastRecord", lastRecord);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("view")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setNo(no);
			dto.setSearchData(searchData);
			dto.setSearchGubun(searchGubun);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			dto = dao.getSelectOne(dto);
			
			request.setAttribute("dto", dto);
			
			System.out.println("1");
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			
			MemoMybatisDTO dto = new MemoMybatisDTO();
			dto.setNo(no);
			dto.setSearchData(searchData);
			dto.setSearchGubun(searchGubun);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			dto = dao.getSelectOne(dto);
			
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chugaProc")) {
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			int failCounter = 0;
			
			if(writer.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				System.out.println("failCounter: " + failCounter);
				return;
			}
			writer = util.getCheckString(writer);
			content = util.getCheckString(content);
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setWriter(writer);
			arguDto.setContent(content);
			arguDto.setSearchGubun(searchGubun);
			arguDto.setSearchData(searchData);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_chuga.do?" +searchQuery);
			}
			
			
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			
			writer = util.getNullBlankCheck(writer);
			content = util.getNullBlankCheck(content);
			int failCounter = 0;
			
			if(writer.equals("")) { failCounter++; }
			if(content.equals("")) { failCounter++; }
			
			if(failCounter > 0) {
				System.out.println("failCounter: " + failCounter);
				return;
			}
			writer = util.getCheckString(writer);
			content = util.getCheckString(content);
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setNo(no);
			arguDto.setWriter(writer);
			arguDto.setContent(content);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setUpdate(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do?" + searchQuery);
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_sujung.do?no=" + no + "&" + searchQuery);
			}
			
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			
			
			MemoMybatisDTO arguDto = new MemoMybatisDTO();
			arguDto.setNo(no);
			
			MemoMybatisDAO dao = new MemoMybatisDAO();
			int result = dao.setDelete(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_list.do");
			} else {
				response.sendRedirect(path + "/memoMybatis_servlet/memoMybatis_sakje.do?no="+ no + "&" + searchQuery);
			}
		} else if(fileName.equals("search")) {
			
	         
	         String moveUrl = path+"/memoMybatis_servlet/memoMybatis_list.do?";
	         moveUrl += searchQuery;
	         response.sendRedirect(moveUrl);
	
		} else {
			return;
		}
		
		
	}

}
