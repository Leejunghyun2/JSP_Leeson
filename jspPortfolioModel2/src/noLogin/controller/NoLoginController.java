package noLogin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.common.Util;
import project.member.model.dao.MemberDAO;
import project.member.model.dto.MemberDTO;

@WebServlet("/noLogin_servlet/*")
public class NoLoginController extends HttpServlet {
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
		
		String forwardPage = "/WEB-INF/project/main/main.jsp";
		if(fileName.equals("login")) {
			RequestDispatcher rd = request.getRequestDispatcher(forwardPage);
			rd.forward(request, response);
		}else if(fileName.equals("loginProc")) {
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");
			
			id = util.getNullBlankCheck(id);
			passwd = util.getNullBlankCheck(passwd);
			
			id = util.getCheckString(id);
			passwd = util.getCheckString(passwd);
			
			if(id.equals("") || passwd.equals("")) {
				return;
			}
			
			MemberDTO arguDto = new MemberDTO();
			arguDto.setId(id);
			arguDto.setPasswd(passwd);
			
			MemberDAO dao = new MemberDAO();
			MemberDTO resultDto = dao.getLogin(arguDto); 
			System.out.println("DD");
			String msg = "아이디 또는 비밀번호가 다릅니다. \\n 다시 이용해주세요..";
			//if(resultDto.getNo() == 0 || resultDto.getName() == null || resultDto.getId() == null) {
			if(resultDto.getNo() > 0) {
				HttpSession session = request.getSession();
				//session.setMaxInactiveInterval(60);
				
				session.setAttribute("sessionId", resultDto.getId());
				session.setAttribute("sessionNo", resultDto.getNo());
				session.setAttribute("sessionName", resultDto.getName());
				msg = "정상적으로 로그인 되었습니다.";
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+msg+"');");
			out.println("location.href ='"+path+"';");
			out.println("</script>");
			out.flush();
			out.close();
		}else if(fileName.equals("logout")) {
			HttpSession session = request.getSession();
			//session.setMaxInactiveInterval(60);
			
			session.invalidate();
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 되었습니다.\\n 즐거운 하루 되세요.');");
			out.println("location.href ='"+path+"';");
			out.println("</script>");
			out.flush();
			out.close();
		}else {
			
		}
	}

}
