package project.board.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.board.model.dao.BoardDAO;
import project.board.model.dto.BoardDTO;
import project.common.Util;


@WebServlet("/board_servlet/*")
public class BoardController extends HttpServlet {
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
		request.setAttribute("fileName", fileName + ".jsp");
		
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
			   int pageSize = 1;
		        int blockSize = 3;
				
		        BoardDTO arguDto2 = new BoardDTO();
		        arguDto2.setSearchData(searchData);
		        arguDto2.setSearchGubun(searchGubun);
		        
		        BoardDAO dao = new BoardDAO();
		        
		        int totalRecord = dao.getTotalRecord(arguDto2);
		        int block = (pageNumber - 1) / blockSize;
		        int jj = totalRecord - pageSize * (pageNumber - 1);
		        
		        double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
		        int totalPage = (int)totalPageDou;
		        
		        int startRecord = pageSize * (pageNumber - 1) + 1;
		        int lastRecord = pageSize * pageNumber;
		        int totalBlock = totalPage / blockSize;
		        
		        
		        request.setAttribute("totalPage", totalPage);
		        request.setAttribute("totalRecord", totalRecord);
		        request.setAttribute("pageSize", pageSize);
		        request.setAttribute("pageNumber", pageNumber);
		        request.setAttribute("blockSize", blockSize);
		        request.setAttribute("block", block);
		        request.setAttribute("jj", jj);
		        request.setAttribute("startRecord", startRecord);
		        request.setAttribute("lastRecord", lastRecord);
		        
		        BoardDTO arguDto = new BoardDTO();
		        arguDto.setSearchData(searchData);
		        arguDto.setSearchGubun(searchGubun);
		        arguDto.setStartRecord(startRecord);
		        arguDto.setLastRecord(lastRecord);
		        
		        ArrayList<BoardDTO> list = dao.getSelectAll(arguDto);
				request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chuga")) {
			String no_ = request.getParameter("no");
			
			int no = util.getNumberCheck(no_ , 0);
			String subject = "";
			String content = "";
			String title = "글쓰기";
			if(no > 0) {
				BoardDTO arguDto = new BoardDTO();
				arguDto.setNo(no);
				BoardDAO dao = new BoardDAO();
				BoardDTO resultDto = dao.getSelectOne(arguDto);
				subject = resultDto.getSubject();
				content = resultDto.getContent();
				title = "답변쓰기";
			}
			
			request.setAttribute("no", no);
			request.setAttribute("subject", subject);
			request.setAttribute("content", content);
			request.setAttribute("title", title);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sujung")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0 ) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
			
	        BoardDAO dao = new BoardDAO();
	        BoardDTO resultDto = dao.getSelectOne(arguDto);
	        
	        request.setAttribute("dto", resultDto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("sakje")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0 ) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
			
	        BoardDAO dao = new BoardDAO();
	        BoardDTO resultDto = dao.getSelectOne(arguDto);
	        
	        resultDto.setContent(resultDto.getContent().replace("\n", "<br>"));
	        request.setAttribute("dto", resultDto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			int no = util.getNumberCheck(no_, 0);
			if(no == 0 ) {
				return;
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSearchData(searchData);
	        arguDto.setSearchGubun(searchGubun);
			
	        BoardDAO dao = new BoardDAO();
	        BoardDTO resultDto = dao.getSelectOne(arguDto);
	        resultDto.setContent(resultDto.getContent().replace("\n", "<br>"));
	        
	        request.setAttribute("dto", resultDto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chugaProc")) {
			String no_ = request.getParameter("no");
			String tbl = request.getParameter("tbl");
			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String noticeGubun = request.getParameter("noticeGubun");
			String secretGubun = request.getParameter("secretGubun");
			String attachInfo = "-";
			
			int no = util.getNumberCheck(no_, 0);
			
			content = util.getCheckString(content);
			
			BoardDAO dao = new BoardDAO();
			int num = dao.getMaxValueNumRefNoNoticeNo("num") + 1;
			int refNo = dao.getMaxValueNumRefNoNoticeNo("refNo") + 1;
			int levelNo = 1;
			int stepNo = 1;
			int parentNo = 0;
			int hit = 0;
			int noticeNo = 0;
			
			if(no > 0) {
				BoardDTO resultDto = new BoardDTO();
				resultDto.setNo(noticeNo);
				resultDto = dao.getSelectOne(resultDto);
				
				refNo = resultDto.getRefNo();
				stepNo = resultDto.getStepNo() + 1;
				dao.setUpdateReLevel(resultDto);
				levelNo = resultDto.getLevelNo() + 1;
			}
			
			String[] sessionArray = util.getSessionCheck(request);
			int sessionNo = Integer.parseInt(sessionArray[0]);
			if(noticeGubun.equals("T")) {
				noticeNo = dao.getMaxValueNumRefNoNoticeNo("noticeNo");
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNum(num);
			arguDto.setTbl(tbl);
			arguDto.setWriter(writer);
			arguDto.setSubject(subject);
			arguDto.setContent(content);
			arguDto.setEmail(email);
			arguDto.setPasswd(passwd);
			arguDto.setRefNo(refNo);
			arguDto.setStepNo(stepNo);
			arguDto.setLevelNo(levelNo);
			arguDto.setParentNo(parentNo);
			arguDto.setHit(hit);
			arguDto.setIp(ip);
			arguDto.setMemberNo(sessionNo);
			arguDto.setNoticeNo(noticeNo);
			arguDto.setSecretGubun(secretGubun);
			arguDto.setAttachInfo(attachInfo);
			
			int result = dao.setInsert(arguDto);
			
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_list.do");
			} else {
				response.sendRedirect(path + "/board_servlet/board_chuga.do");
			}
			
		} else if(fileName.equals("sujungProc")) {
			String no_ = request.getParameter("no");
			String tbl = "-";
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String email = request.getParameter("email");
			String passwd = request.getParameter("passwd");
			String noticeGubun = request.getParameter("noticeGubun");
			String secretGubun = request.getParameter("secretGubun");
			String attachInfo = "-";
			
			int no = util.getNumberCheck(no_, 0);
			int noticeNo = 0;
			
			content = util.getCheckString(content);
			
			BoardDTO dto = new BoardDTO();
			dto.setNo(no);
			
			BoardDAO dao = new BoardDAO();
			dto = dao.getSelectOne(dto);
			if(noticeGubun.equals("T")) {
				if(dto.getNoticeNo() <= 0) {
					noticeNo = dao.getMaxValueNumRefNoNoticeNo("noticeNo");
				}
			} else {
				if(dto.getNoticeNo() > 0 ) {
					noticeNo = 0;
				}
			}
			String[] sessionArray = util.getSessionCheck(request);
			int sessionNo = Integer.parseInt(sessionArray[0]);
			if(noticeGubun.equals("T")) {
				noticeNo = dao.getMaxValueNumRefNoNoticeNo("noticeNo");
			}
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setSubject(subject);
			arguDto.setContent(content);
			arguDto.setEmail(email);
			arguDto.setPasswd(passwd);
			arguDto.setIp(ip);
			arguDto.setMemberNo(sessionNo);
			arguDto.setNoticeNo(noticeNo);
			arguDto.setSecretGubun(secretGubun);
			arguDto.setAttachInfo(attachInfo);
			
			int result = dao.setUpdate(arguDto);
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_view.do?no="+ no +"&" + searchQuery);
			} else {
				response.sendRedirect(path + "/board_servlet/board_sujung.do?no="+ no);
			}
		} else if(fileName.equals("sakjeProc")) {
			String no_ = request.getParameter("no");
			String passwd = request.getParameter("passwd");
			
			int no = util.getNumberCheck(no_, 0);
			
			
			BoardDTO dto = new BoardDTO();
			dto.setNo(no);
			
			BoardDAO dao = new BoardDAO();
			dto = dao.getSelectOne(dto);
			
			BoardDTO arguDto = new BoardDTO();
			arguDto.setNo(no);
			arguDto.setPasswd(passwd);
			
			int result = dao.setDelete(arguDto);
			if(result > 0) {
				response.sendRedirect(path + "/board_servlet/board_list.do");
			} else {
				response.sendRedirect(path + "/board_servlet/board_sakje.do?no="+ no);
			}
		
		} else if(fileName.equals("search")) {
			 String moveUrl = path+"/board_servlet/board_list.do?";
	         moveUrl += searchQuery;
	         response.sendRedirect(moveUrl);
		}
	}
}
