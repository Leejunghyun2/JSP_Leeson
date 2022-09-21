package employee.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _common.Util;
import employee.model.dao.BuseoDAO;
import employee.model.dto.BuseoDTO;
import haksa.model.dao.SihumDAO;
import haksa.model.dto.SihumDTO;

@WebServlet("/buseo_servlet/*")
public class BuseoController extends HttpServlet {
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
		
		request.setAttribute("path", path);
		
		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];
		
		String forwardPage = "/WEB-INF/_test/buseo/";
		
		if(imsiUriFileName.equals("list.do")) {
			
			BuseoDAO dao = new BuseoDAO();
			ArrayList<BuseoDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			forwardPage += "list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("view.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO resultDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			forwardPage += "view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("chuga.do")) {
			forwardPage += "chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("sakje.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO resultDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
	
	
			
			forwardPage += "sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(imsiUriFileName.equals("sujung.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO dao = new BuseoDAO();
			BuseoDTO resultDto = dao.getSelectOne(arguDto);
			
			request.setAttribute("dto", resultDto);
			
			forwardPage += "sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
			
		} else if(imsiUriFileName.equals("chugaProc.do")) {
			String buseoName = request.getParameter("buseoName");
			buseoName = util.getNullBlankCheck(buseoName);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoName(buseoName);
			
			BuseoDAO BuseoDAO = new BuseoDAO();
			int result = BuseoDAO.setInsert(arguDto);
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/list.do");
			}else {
				response.sendRedirect(path + "/buseo_servlet/chuga.do");
			}
			
		} else if(imsiUriFileName.equals("sakjeProc.do")) {
			
			String buseoNo_ = request.getParameter("buseoNo");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			
			BuseoDAO BuseoDAO = new BuseoDAO();
			int result = BuseoDAO.setDelete(arguDto);
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/list.do");
			}else {
				response.sendRedirect(path + "/buseo_servlet/chuga.do");
			}
		} else if(imsiUriFileName.equals("sujungProc.do")) {
			String buseoNo_ = request.getParameter("buseoNo");
			String buseoName = request.getParameter("buseoName");
			int buseoNo = util.getNumberCheck(buseoNo_, 0);
			buseoName = util.getNullBlankCheck(buseoName);
			BuseoDTO arguDto = new BuseoDTO();
			arguDto.setBuseoNo(buseoNo);
			arguDto.setBuseoName(buseoName);
			
			BuseoDAO BuseoDAO = new BuseoDAO();
			int result = BuseoDAO.setUpdate(arguDto);
			if(result > 0) {
				response.sendRedirect(path + "/buseo_servlet/list.do");
			}else {
				response.sendRedirect(path + "/buseo_servlet/sujung.do?buseoNo="+buseoNo);
			}
		} else {
			System.out.println("없네");
		}
		
	}

	

}
