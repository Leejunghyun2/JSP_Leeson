package sihum.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sihum.member.model.dao.MemberDAO;
import sihum.member.model.dto.MemberDTO;



@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
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
		
	
		
		request.setAttribute("path", path);
		request.setAttribute("folderName", folderName);
		request.setAttribute("fileName", fileName + ".jsp");  // main안에서 이루어지기위해 매개변수를 날림
		String forwardPage = "/WEB-INF/sihum/main/main.jsp"; //index.jsp 파일이 있는경로 설정
		if(fileName.equals("chuga")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("chugaProc")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			String passwdChk = request.getParameter("passwdChk");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String birthYear = request.getParameter("birthYear");
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			int failCounter = 0;
			if(id == null || id.trim().equals("")) { failCounter++; System.out.println("1"); }
			if(passwd == null || passwd.trim().equals("")) { failCounter++; System.out.println("2"); }
			if(passwdChk == null || passwdChk.trim().equals("")) { failCounter++; System.out.println("3"); }
			if(name == null || name.trim().equals("")) { failCounter++; System.out.println("4"); }
			if(gender == null || gender.trim().equals("")) { failCounter++; System.out.println("5");}
			if(birthYear == null || birthYear.trim().equals("")) { failCounter++; System.out.println("6"); }
			if(addr1 == null || addr1.trim().equals("")) { failCounter++; System.out.println("7"); }
			if(addr2 == null || addr2.trim().equals("")) { failCounter++;  System.out.println("8");}
			if(addr3 == null || addr3.trim().equals("")) { addr3 = "-"; System.out.println("9"); }
			if(addr4 == null || addr4.trim().equals("")) { addr4 = "-"; System.out.println("10");}
			if(!passwd.equals(passwdChk)) { failCounter++; System.out.println("11"); }
			
			if(failCounter > 0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('잘못 입력하셧습니다 \\n 다시 입력해주세요.');");
				out.println("location.href = '"+path+"/member_servlet/member_chuga.do'");
				out.println("</script>");
				return;
			}
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setGender(gender);
			dto.setBirthYear(birthYear);
			dto.setAddr1(addr1);
			dto.setAddr2(addr2);
			dto.setAddr3(addr3);
			dto.setAddr4(addr4);
			
			MemberDAO dao = new MemberDAO();
			int result = dao.setInsert(dto);
			if(result > 0) {
				response.sendRedirect(path + "/member_servlet/member_list.do");
			} else {
				response.sendRedirect(path + "/member_servlet/member_chuga.do");
			}
			
		} else if(fileName.equals("list")) {
			
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getSelectAll();
			
			request.setAttribute("list", list);
			
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else if(fileName.equals("view")) {
			String no_ = request.getParameter("no");
			if(no_ == null || no_.trim().equals("")) {
				no_ = "0";
			}
			int no = Integer.parseInt(no_);
			MemberDTO dto = new MemberDTO();
			dto.setNo(no);
			
			MemberDAO dao = new MemberDAO();
			dto = dao.getSelectOne(dto);
			
			request.setAttribute("dto", dto);
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		} else {
			
		}
	}

}
