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
import employee.model.dao.EmployeeDAO;
import employee.model.dto.BuseoDTO;
import employee.model.dto.EmployeeDTO;
import haksa.model.dao.SihumDAO;
import haksa.model.dto.SihumDTO;

@WebServlet("/employee_servlet/*")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doProc(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		Util util = new Util();
		String path = request.getContextPath();
		String url = request.getRequestURL().toString();
		String uri = request.getRequestURI().toString();

		request.setAttribute("path", path);

		String[] imsiUriArray = uri.split("/");
		String imsiUriFileName = imsiUriArray[imsiUriArray.length - 1];

		String forwardPage = "/WEB-INF/_test/employee/";

		if (imsiUriFileName.equals("list.do")) {

			EmployeeDAO dao = new EmployeeDAO();
			ArrayList<EmployeeDTO> list = dao.getSelectAll();

			request.setAttribute("list", list);
			forwardPage += "list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);

		} else if (imsiUriFileName.equals("view.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);

			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO resultDto = dao.getSelectOne(arguDto);

			request.setAttribute("dto", resultDto);

			forwardPage += "view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if (imsiUriFileName.equals("chuga.do")) {

			BuseoDAO dao = new BuseoDAO();
			ArrayList<BuseoDTO> list = dao.getSelectAll();

			request.setAttribute("list", list);

			forwardPage += "chuga.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if (imsiUriFileName.equals("sakje.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);

			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO resultDto = dao.getSelectOne(arguDto);

			request.setAttribute("dto", resultDto);

			forwardPage += "sakje.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if (imsiUriFileName.equals("sujung.do")) {
			String sabun_ = request.getParameter("sabun");
			int sabun = util.getNumberCheck(sabun_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);

			EmployeeDAO dao = new EmployeeDAO();
			EmployeeDTO resultDto = dao.getSelectOne(arguDto);

			request.setAttribute("dto", resultDto);

			forwardPage += "sujung.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);

		} else if (imsiUriFileName.equals("chugaProc.do")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String hireDate_ = request.getParameter("hireDate");
			String email = request.getParameter("email");
			String salary_ = request.getParameter("salary");
			String buseo_ = request.getParameter("buseo");
			String positionNo_ = request.getParameter("positionNo");

			int positionNo = util.getNumberCheck(positionNo_, 0);
			int buseo = util.getNumberCheck(buseo_, 0);
			hireDate_ = util.getNullBlankCheck(hireDate_);
			Date hireDate = Date.valueOf(hireDate_);

			int salary = util.getNumberCheck(salary_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setName(name);
			arguDto.setPhone(phone);
			arguDto.setHireDate(hireDate);
			arguDto.setEmail(email);
			arguDto.setSalary(salary);
			arguDto.setBuseo(buseo);
			arguDto.setPositionNo(positionNo);
			
			EmployeeDAO employeeDao = new EmployeeDAO();
			int result = employeeDao.setInsert(arguDto);
			if (result > 0) {
				response.sendRedirect(path + "/employee_servlet/list.do");
			} else {
				response.sendRedirect(path + "/employee_servlet/chuga.do");
			}

		} else if (imsiUriFileName.equals("sakjeProc.do")) {
			String sabun_ = request.getParameter("sabun");

			int sabun = util.getNumberCheck(sabun_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);

			EmployeeDAO employeeDao = new EmployeeDAO();
			int result = employeeDao.setDelete(arguDto);
			if (result > 0) {
				response.sendRedirect(path + "/employee_servlet/list.do");
			} else {
				response.sendRedirect(path + "/employee_servlet/chuga.do");
			}
		} else if (imsiUriFileName.equals("sujungProc.do")) {
			String sabun_ = request.getParameter("sabun");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String salary_ = request.getParameter("salary");
			String buseo_ = request.getParameter("buseo");
			String positionNo_ = request.getParameter("positionNo");

			int positionNo = util.getNumberCheck(positionNo_, 0);
			int buseo = util.getNumberCheck(buseo_, 0);
			int sabun = util.getNumberCheck(sabun_, 0);
			int salary = util.getNumberCheck(salary_, 0);

			EmployeeDTO arguDto = new EmployeeDTO();
			arguDto.setSabun(sabun);
			arguDto.setPhone(phone);
			arguDto.setEmail(email);
			arguDto.setSalary(salary);
			arguDto.setBuseo(buseo);
			arguDto.setPositionNo(positionNo);
			System.out.println(positionNo);
			EmployeeDAO employeeDao = new EmployeeDAO();
			int result = employeeDao.setUpdate(arguDto);
			if (result > 0) {
				response.sendRedirect(path + "/employee_servlet/list.do");
			} else {
				response.sendRedirect(path + "/employee_servlet/sujung.do?sabun" + sabun);
			}
		} else {
			System.out.println("없네");
		}

	}

}
